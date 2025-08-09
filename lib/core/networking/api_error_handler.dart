import 'package:dio/dio.dart';

import 'api_error_model.dart';

part 'errors_data.dart';

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

class ErrorHandler implements Exception {
  ApiErrorModel? apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
      return;
    }

    if (error is String) {
      apiErrorModel = ApiErrorModel(message: error);
      return;
    }

    if (error is Exception) {
      final errorMessage = error.toString().split(':').last;
      apiErrorModel = ApiErrorModel(message: errorMessage);
      return;
    }

    apiErrorModel = DataSource.defaultError.getFailure();
  }

  String get errorMessage => apiErrorModel?.message ?? 'Unknown error';

  ApiErrorModel _handleError(DioException error) {
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
          ApiErrorModel? apiErrorModel;
          _errorsData.forEach((key, value) {
            if (value.code == response.statusCode) {
              apiErrorModel = value;
            }
          });
          if (apiErrorModel != null) return apiErrorModel!;
        }

        return DataSource.defaultError.getFailure();

      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        return DataSource.defaultError.getFailure();
    }
  }
}
