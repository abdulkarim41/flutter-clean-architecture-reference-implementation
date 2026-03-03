import 'package:domain/domain.dart';

sealed class Result<T> {
  const Result();

  // Pattern matching for success/failure
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  }) {

    return switch (this) {
      final Success<T> successResult => success(successResult.data),
      final Failure<T> failureResult => failure(failureResult.error),
    };
  }

  // Helper methods
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get dataOrNull => isSuccess ? (this as Success<T>).data : null;
  ApiError? get errorOrNull => isFailure ? (this as Failure<T>).error : null;
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final ApiError error;

  const Failure(this.error);
}