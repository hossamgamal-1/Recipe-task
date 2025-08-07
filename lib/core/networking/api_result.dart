import 'api_error_handler.dart';

sealed class ApiResult<T> {}

class SuccessResult<T> extends ApiResult<T> {
  final T data;

  SuccessResult(this.data);
}

class FailureResult<T> extends ApiResult<T> {
  final String errorMessage;

  FailureResult(ErrorHandler errorHandler)
      : errorMessage = errorHandler.errorMessage;
}
