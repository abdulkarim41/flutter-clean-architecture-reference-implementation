import 'package:data/data.dart';
import 'package:domain/domain.dart';

mixin ApiHandler {
  Future<Result<T>> performApiCall<T, R>({
    required Future<dynamic> Function() request,
    void Function(T)? onSuccess,
    required T Function(R) mapResponse,
    bool shouldRetry = true,
    int maxRetries = 1,
    Duration retryDelay = const Duration(seconds: 1),
    ApiError Function(NetworkException)? errorMapper,
  }) async {
    var attempt = 1;

    Future<Result<T>> execute() async {
      try {
        final response = await request();
        final mapped = mapResponse(response);
        if (onSuccess != null) {
          onSuccess(mapped);
        }
        return Success(mapped);
      } on NetworkException catch (e) {
        if (shouldRetry && attempt < maxRetries) {
          await Future.delayed(retryDelay);
          attempt++;
          return execute();
        }
        return Failure(
          errorMapper?.call(e) ?? _mapNetworkExceptionToApiError(e),
        );
      } on FormatException catch (message, stackTrace) {

        return const Failure(ApiError.formatMismatch());
      }
      // ignore: avoid_catching_errors
      on TypeError catch (message, stackTrace){

        return const Failure(ApiError.formatMismatch());
      } catch (e) {
        return const Failure(ApiError.unknown());
      }
    }

    return execute();
  }

  ApiError _mapNetworkExceptionToApiError(NetworkException e) =>
      e.map<ApiError>(
        serverTimeout: () => const ApiError.serverTimeout(),
        unauthorized: ApiError.unauthorized,
        unknown: (message) => const ApiError.unknown(),
        serverError: ApiError.serverError,
        noInternet: () => const ApiError.noInternet(),
      );
}
