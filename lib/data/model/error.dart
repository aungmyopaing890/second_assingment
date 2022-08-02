class ApiError {
  final String? message;
  final List? error;

  ApiError(this.message, this.error);

  ApiError.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        error = json['errors'];
}
