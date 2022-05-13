import 'package:get/get_connect/connect.dart';

import 'package:get/get.dart';

class IndexConnect extends GetConnect {
  Future<dynamic> index(String url) async {
    final response = await get(
      url,
      contentType: "application/json",
      headers: {
        "Accept": "application/json",
      },
    );
    return response;
  }
}
