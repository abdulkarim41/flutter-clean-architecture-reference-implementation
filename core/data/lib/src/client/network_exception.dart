sealed class NetworkException implements Exception{

  const NetworkException();

  const factory NetworkException.noInternet() = _NoInternetException;
  const factory NetworkException.serverTimeout() = _TimeoutException;
  const factory NetworkException.unauthorized(int statusCode) = _UnauthorizedException;
  const factory NetworkException.serverError({
    required String message,
    required int statusCode,
  }) = _ServerErrorException;
  const factory NetworkException.unknown(String description) = _UnknownException;



  T map<T>({
    required T Function() serverTimeout,
    required T Function(int statusCode) unauthorized,
    required T Function({required String message, required int statusCode}) serverError,
    required T Function() noInternet,
    required T Function(String description) unknown,
  }) => switch (this) {
    _NoInternetException() => noInternet(),
    _TimeoutException() => serverTimeout(),
    _UnauthorizedException(:final statusCode) => unauthorized(statusCode),
    _ServerErrorException(:final message, :final statusCode) => serverError(message: message, statusCode: statusCode),
    _UnknownException(:final description) => unknown(description),
  };
}

class _NoInternetException extends NetworkException {
  const _NoInternetException();
}
class _TimeoutException extends NetworkException {
  const _TimeoutException();
}

class _UnauthorizedException extends NetworkException {
  final int statusCode;
  const _UnauthorizedException(this.statusCode);
}

class _ServerErrorException extends NetworkException {
  final String message;
  final int statusCode;
  const _ServerErrorException({
    required this.message,
    required this.statusCode,
  });
}

class _UnknownException extends NetworkException {
  final String description;
  const _UnknownException(this.description);
}