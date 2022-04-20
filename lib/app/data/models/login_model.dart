class Login {
  bool? success;
  String? message;
  Data? data;

  Login({
    this.success,
    this.message,
    this.data,
  });

  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  String? expiresIn;

  Data({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
}
