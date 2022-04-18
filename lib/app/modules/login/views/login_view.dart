import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';
import 'package:flutter_pos/app/global_widgets/app_bar.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: ColorManager.PRIMARY,
        title: "Hello World!",
      ),
      body: Center(
        child: Text(
          'LoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
