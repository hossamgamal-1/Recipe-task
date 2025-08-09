part of 'api_error_handler.dart';

// DO NOT edit enum DataSource values without as it's based DioExceptionType values
enum DataSource {
  noContent,
  badRequest,
  unAuthorized,
  forbidden,
  internalServerError,
  notFound,
  apiLogicError,
  serverFailure,
  badGateway,

  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  parsingError,

  defaultError,
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() => _errorsData[this]!;
}

final _errorsData = <DataSource, ApiErrorModel>{
  DataSource.noContent: const ApiErrorModel(code: 201, message: 'No content'),
  DataSource.badRequest: const ApiErrorModel(code: 400, message: 'Bad request'),

  DataSource.unAuthorized: const ApiErrorModel(
    code: 401,
    message: 'Unauthorized',
  ),

  DataSource.forbidden: const ApiErrorModel(code: 403, message: 'Forbidden'),
  DataSource.notFound: const ApiErrorModel(code: 404, message: 'Not found'),

  DataSource.internalServerError: const ApiErrorModel(
    code: 500,
    message: 'Internal server error',
  ),
  DataSource.serverFailure: const ApiErrorModel(
    code: 502,
    message: 'Server failure',
  ),
  DataSource.badGateway: const ApiErrorModel(
    code: 503,
    message: 'Service unavailable',
  ),

  DataSource.apiLogicError: const ApiErrorModel(
    code: 422,
    message: 'API logic error',
  ),

  DataSource.connectionTimeout: const ApiErrorModel(
    code: -1,
    message: 'Connection timeout',
  ),

  DataSource.cancel: const ApiErrorModel(code: -2, message: 'Cancel'),

  DataSource.receiveTimeout: const ApiErrorModel(
    code: -3,
    message: 'Receive timeout',
  ),

  DataSource.sendTimeout: const ApiErrorModel(
    code: -4,
    message: 'Send timeout',
  ),

  DataSource.cacheError: const ApiErrorModel(code: -5, message: 'Cache error'),

  DataSource.noInternetConnection: const ApiErrorModel(
    code: -6,
    message: 'No internet connection',
  ),
  DataSource.parsingError: const ApiErrorModel(
    code: -7,
    message: 'Parsing error',
  ),

  DataSource.defaultError: const ApiErrorModel(
    code: -8,
    message: 'Something went wrong',
  ),

  // Add your custom errors here
};
