import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:common/common.dart';
import 'package:data/src/client/network_exception.dart';
import 'package:http/http.dart' as http;

final class NetworkClient {
  final String _baseUrl;
  final Duration _timeout;
  final SecureStorage _secureStorage;
  bool _refreshAttempted = false;

  NetworkClient({
    required String baseUrl,
    required SecureStorage secureStorage,
    Duration timeout = const Duration(seconds: 30),
  })
      : _baseUrl = baseUrl,
        _timeout = timeout,
        _secureStorage = secureStorage;

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) => _handleRequest(() => _performGetRequest(endpoint, queryParams));

  Future<dynamic> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) => _handleRequest(() => _performPostRequest(endpoint, body));

  Future<dynamic> postFile({
    required String endpoint,
    required Map<String, String> fields,
    required Map<String, File> files,
  }) => _handleRequest(
    () => _performMultipartRequest(
      endpoint: endpoint,
      fields: fields,
      files: files,
    ),
  );

  Future<dynamic> put({
    required String endpoint,
    required Map<String, dynamic> body,
  }) => _handleRequest(() => _performPutRequest(endpoint, body));

  // Internal request methods
  Future<http.Response> _performGetRequest(
    String endpoint,
    Map<String, dynamic>? queryParams,
  ) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    return http.get(uri, headers: await _headers).timeout(_timeout);
  }

  Future<http.Response> _performPostRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    Logcat.log('''
      [POST] $_baseUrl$endpoint
      Body: $body
    ''');

    return http
        .post(
          Uri.parse('$_baseUrl$endpoint'),
          headers: await _headers,
          body: jsonEncode(body),
        )
        .timeout(_timeout);
  }

  Future<http.Response> _performPutRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    Logcat.log('''
      [POST] $_baseUrl$endpoint
      Body: $body
    ''');

    return http
        .put(
          Uri.parse('$_baseUrl$endpoint'),
          headers: await _headers,
          body: jsonEncode(body),
        )
        .timeout(_timeout);
  }

  Future<http.Response> _performMultipartRequest({
    required String endpoint,
    required Map<String, String> fields,
    required Map<String, File> files,
  }) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endpoint'))
          ..headers.addAll(await _headers)
          ..fields.addAll(fields);

    for (final entry in files.entries) {
      request.files.add(
        await http.MultipartFile.fromPath(entry.key, entry.value.path),
      );
    }

    final streamedResponse = await request.send().timeout(_timeout);

    return http.Response.fromStream(streamedResponse);
  }

  // Helpers
  Future<Map<String, String>> get _headers async {
    final token = await _secureStorage.get(key: SpKey.accessToken);
    Logcat.log("Auth Token: $token");

    return {
      "Content-Type": "application/json",
      "Authorization": token.isNotEmpty ? 'Bearer $token' : '',
    };
  }

  // Response handling
  Future<dynamic> _handleRequest(Future<http.Response> Function() request) async {
    try {
      final response = await request();
      _logRequest(response);

      return _processResponse(response, request);
    } on SocketException {
      throw const NetworkException.noInternet();
    } on TimeoutException {
      throw const NetworkException.serverTimeout();
    } on NetworkException{
      rethrow;
    }catch (e) {
      throw NetworkException.unknown(e.toString());
    }
  }

  dynamic _processResponse(
    http.Response response,
    Future<http.Response> Function() request,
  ) {
    final body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else if (response.statusCode == 401) {
      return _handleTokenRefresh(request);
    } else if (response.statusCode == 403) {
      throw NetworkException.unauthorized(response.statusCode);
    }else {
      throw NetworkException.serverError(
        statusCode: response.statusCode,
        message: body['message'] ?? 'Request failed',
      );
    }
  }

  Future<dynamic> _handleTokenRefresh(Future<http.Response> Function() request) async {
    if(_refreshAttempted){
      throw const NetworkException.unauthorized(401);
    }
    _refreshAttempted = true;

    try {
      final response = await get(endpoint: 'auth/refresh');
      final newToken = response['accessToken'] as String?;
      if (newToken == null || newToken.isEmpty) {
        throw NetworkException.unauthorized(401);
      }
      await _secureStorage.set(key: SpKey.accessToken, value: newToken);

      // Retry original request once
      return _handleRequest(request);
    } catch (e) {
      throw NetworkException.unauthorized(401);
    } finally {
      _refreshAttempted = false; // reset for next API call
    }
  }
  
  void _logRequest(http.Response response) {
    logger.i('''
      [${response.request?.method}] ${response.request?.url}
      Status: ${response.statusCode}
      Body: ${response.body}
      Headers: ${response.request?.headers}
    ''');
  }
}
