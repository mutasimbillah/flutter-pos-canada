import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    
    bool isAuthenticated = GetStorage().read("token") != null;
    if (!isAuthenticated) {
      return RouteSettings(name: Routes.LOGIN);
    }
  }
}
