class ApiErrorModel {
  final String errorMessage;
  final int? code;

  const ApiErrorModel({this.errorMessage = 'Unknown Error', this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      errorMessage: json['errorMessage'] as String? ?? 'Unknown Error',
      code: json['code'],
    );
  }
}
