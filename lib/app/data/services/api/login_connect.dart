import 'package:get/get_connect/connect.dart';

import 'package:get/get.dart';

class LoginConnect extends GetConnect {
  Future<dynamic> login(
    String url,
    Map<String, dynamic> body,
  ) async {
    final response = await post(
      url,
      body,
      contentType: "application/json",
      headers: {
        "Accept": "application/json",
      },
    );
    return response;
  }
}
