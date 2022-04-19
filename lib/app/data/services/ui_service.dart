import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';
import 'package:get/get.dart';

class UiService extends GetxService {
  Future<UiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  void errorDialog(String title, String msg) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          OutlinedButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  void errorSnackBar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      colorText: ColorManager.TEXT,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: ColorManager.DANGER,
      borderRadius: 0,
      margin: EdgeInsets.only(bottom: 2),
      isDismissible: true,
    );
  }
}
