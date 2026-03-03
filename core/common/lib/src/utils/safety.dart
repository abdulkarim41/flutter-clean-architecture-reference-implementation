import 'dart:developer' as logcat;
import 'dart:math';


// A wrapper to run async code safely, logging any error and returning null on failure.
Future<T?> safeAsync<T>(String label, Future<T> Function() run) async {
  try {
    logcat.log('$label stated');
    return await run();
  } catch (e, st) {
    logcat.log('$label failed: $e\n$st');
    return null;
  }
}

// A wrapper to run sync code safely, logging any error.
void safeSync(String label, void Function() run) {
  try {
    logcat.log('$label stated');
    run();
  } catch (e, st) {
    logcat.log('$label failed: $e\n$st');
  }
}

// A wrapper to run a task with retry logic and exponential backoff with jitter.
Future<T> withRetry<T>(
    String label,
    Future<T> Function() task, {
      int maxAttempts = 3,
      Duration baseDelay = const Duration(milliseconds: 400),
      bool Function(Object error)? shouldRetry,
    }) async {
  var attempt = 0;
  final rng = Random();

  while (true) {
    attempt++;
    try {
      return await task();
    } catch (e, st) {
      if (shouldRetry != null && !shouldRetry(e)) rethrow;
      logcat.log('$label (attempt $attempt) failed: $e\n$st');
      if (attempt >= maxAttempts) rethrow;

      final backoff = baseDelay * (1 << (attempt - 1));
      final jitter = Duration(milliseconds: 150 + rng.nextInt(200));
      await Future.delayed(backoff + jitter);
    }
  }
}