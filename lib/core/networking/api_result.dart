import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/api_response.dart';
import 'api_error_handler.dart';

sealed class ApiResult<T> {
  /// Handles API calls Exceptions and maps the result.
  static Future<ApiResult<L>> handle<T, L>(
    Future<ApiResponse<T>> Function() apiCall,
    L Function(T) onSuccess,
  ) async {
    try {
      if (!(await _connectionCheck())) {
        return FailureResult('No Internet Connection');
      }

      final response = await apiCall();

      if (!response.success || response.data == null) {
        return FailureResult(response.error?.toString() ?? 'Unknown error');
      }

      return SuccessResult(onSuccess(response.data as T));
    } catch (e) {
      return FailureResult(e);
    }
  }

  static Future<bool> _connectionCheck() async {
    final isTest = Platform.environment.containsKey('FLUTTER_TEST');
    if (isTest) return true;

    return await InternetConnectionChecker().hasConnection;
  }
}

class SuccessResult<T> extends ApiResult<T> {
  final T data;

  SuccessResult(this.data);
}

class FailureResult<T> extends ApiResult<T> {
  final String errorMessage;

  FailureResult(dynamic error)
    : errorMessage = ErrorHandler.handle(error).errorMessage;
}
