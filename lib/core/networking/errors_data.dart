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
  DataSource.noContent: const ApiErrorModel(
    code: 201,
    message: 'لا توجد بيانات',
  ),
  DataSource.badRequest: const ApiErrorModel(
    code: 400,
    message: 'طلب غير صالح',
  ),

  DataSource.unAuthorized: const ApiErrorModel(
    code: 401,
    message: 'غير مصرح به',
  ),

  DataSource.forbidden: const ApiErrorModel(code: 403, message: 'غير مسموح به'),
  DataSource.notFound: const ApiErrorModel(
    code: 404,
    message: 'الصفحة غير موجودة',
  ),

  DataSource.internalServerError: const ApiErrorModel(
    code: 500,
    message: 'خطأ في الخادم الداخلي',
  ),
  DataSource.serverFailure: const ApiErrorModel(
    code: 502,
    message: 'خطأ في الخادم',
  ),
  DataSource.badGateway: const ApiErrorModel(
    code: 503,
    message: 'الخادم غير متاح مؤقتاً',
  ),

  DataSource.apiLogicError: const ApiErrorModel(
    code: 422,
    message: 'Api Logic Error',
  ),

  DataSource.connectionTimeout: const ApiErrorModel(
    code: -1,
    message: 'تجاوز وقت الاتصال',
  ),

  DataSource.cancel: const ApiErrorModel(code: -2, message: 'Cancel'),

  DataSource.receiveTimeout: const ApiErrorModel(
    code: -3,
    message: 'تجاوز وقت الاستلام',
  ),

  DataSource.sendTimeout: const ApiErrorModel(
    code: -4,
    message: 'تجاوز وقت الإرسال',
  ),

  DataSource.cacheError: const ApiErrorModel(code: -5, message: 'Cache Error'),

  DataSource.noInternetConnection: const ApiErrorModel(
    code: -6,
    message: 'لا يوجد اتصال بالانترنت',
  ),
  DataSource.parsingError: const ApiErrorModel(
    code: -7,
    message: 'خطأ في تحليل البيانات',
  ),

  DataSource.defaultError: const ApiErrorModel(code: -8, message: 'حدث خطأ ما'),

  // Add your custom errors here
};
