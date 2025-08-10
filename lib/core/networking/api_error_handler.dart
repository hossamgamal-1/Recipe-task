import 'package:dio/dio.dart';

import 'api_error_model.dart';

part 'errors_data.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) return _handleError(error);

    if (error is String) return ApiErrorModel(errorMessage: error);

    if (error is Exception) {
      return ApiErrorModel(errorMessage: error.toString().split(':').last);
    }

    if (error is TypeError) {
      return DataSource.parsingError.getFailure();
    }

    return DataSource.defaultError.getFailure();
  }

  static ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.cancel:
        return error.type.getFailure();

      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        final response = error.response;

        final hasResponse = response != null;
        final hasStatusCode = response?.statusCode != null;
        final hasStatusMessage = response?.statusMessage != null;

        if (hasResponse &&
            response.data is Map &&
            hasStatusCode &&
            hasStatusMessage) {
          return ApiErrorModel.fromJson(response.data);
        }

        if (hasResponse && hasStatusCode) {
          ApiErrorModel? apiErrorModel =
              _errorsData.entries
                  .where((e) => e.value.code == response.statusCode)
                  .firstOrNull
                  ?.value;

          if (apiErrorModel != null) return apiErrorModel;
        }

        return DataSource.defaultError.getFailure();

      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
    }
  }
}

extension DioErrorExtension on DioExceptionType {
  ApiErrorModel getFailure() {
    try {
      final dataSource = DataSource.values.byName(name);
      return dataSource.getFailure();
    } catch (e) {
      throw Exception('$name is not a valid DataSource enum value.');
    }
  }
}
