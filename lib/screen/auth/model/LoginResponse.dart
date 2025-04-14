class LoginResponse {
  final String? accessToken;
  final String? message;

  LoginResponse({this.accessToken, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['accessToken'], message: json['message']);
  }
}
