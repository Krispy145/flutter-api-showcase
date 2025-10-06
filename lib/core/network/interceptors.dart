import 'package:dio/dio.dart';
import '../utils/logger.dart';

/// Interceptor to add API key to requests
class ApiKeyInterceptor extends Interceptor {
  const ApiKeyInterceptor(this._getApiKey);

  final String Function() _getApiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = _getApiKey();
    if (apiKey.isNotEmpty) {
      options.headers['Authorization'] = apiKey;
    }
    handler.next(options);
  }
}

/// Interceptor for pretty logging of requests and responses
class PrettyLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    appLogger.d(
      '🚀 ${options.method} ${options.uri}',
      error: options.data,
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    appLogger.d(
      '✅ ${response.statusCode} ${response.requestOptions.uri}',
      error: response.data,
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    appLogger.e(
      '❌ ${err.response?.statusCode} ${err.requestOptions.uri}',
      error: err.error,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}

/// Interceptor for retrying failed requests with exponential backoff
class RetryInterceptor extends Interceptor {
  const RetryInterceptor({this.retryCount = 3});

  final int retryCount;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      final attempts = err.requestOptions.extra['retry_attempts'] as int? ?? 0;

      if (attempts < retryCount) {
        final delay = Duration(milliseconds: 1000 * (1 << attempts));
        appLogger.d(
            '🔄 Retrying request in ${delay.inMilliseconds}ms (attempt ${attempts + 1}/$retryCount)');

        await Future.delayed(delay);

        final newOptions = err.requestOptions.copyWith(
          extra: {...err.requestOptions.extra, 'retry_attempts': attempts + 1},
        );

        try {
          final response = await Dio().fetch(newOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          // Continue to next retry or fail
        }
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }
}
