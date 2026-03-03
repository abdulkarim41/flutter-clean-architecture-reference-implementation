sealed class ApiError{
  final String message;
  final int statusCode;

  const ApiError({
    required this.message,
    required this.statusCode,
  });

  const factory ApiError.noInternet() =  _NoInternet;
  const factory ApiError.serverTimeout() =  _ServerTimeout;
  const factory ApiError.unauthorized(int statusCode) =  _Unauthorized;
  const factory ApiError.formatMismatch() =  _FormatMismatch;
  const factory ApiError.serverError({
    required String message,
    required int statusCode,
  }) =  _ServerError;
  const factory ApiError.unknown() =  _UnknownError;
  const factory ApiError.cloudflareTokenError(String? message) =  _CloudflareTokenError;

  @override
  String toString() => 'ApiError: $message ${'(code: $statusCode)'}';
}

class _NoInternet extends ApiError {
  const _NoInternet() : super(message: 'No internet connection, Please check your internet connection.', statusCode: 0);
}

class _ServerTimeout extends ApiError {
  const _ServerTimeout() : super(message: "Request timed out, Please try again later.", statusCode: 408);
}

class _Unauthorized extends ApiError {
  const _Unauthorized(int statusCode) : super(message: "Session expired. Please sign in again", statusCode: statusCode);
}

class _FormatMismatch extends ApiError {
  const _FormatMismatch() : super(message: "Format mismatch, Please try again.", statusCode: 0);
}

class _ServerError extends ApiError {
  const _ServerError({
    required super.message,
    required super.statusCode,
  });
}

class _CloudflareTokenError extends ApiError {
  const _CloudflareTokenError(String? message):super(
    message: message ?? "Security verification failed. Please try again.",
    statusCode: 0,
  );
}

class _UnknownError extends ApiError {
  const _UnknownError() : super(message: "Unknown error occurred. Please try again.", statusCode: 0);
}
