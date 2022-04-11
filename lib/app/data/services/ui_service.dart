import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiService extends GetxService {
  Future<UiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  void openDialog(String title, String msg) {
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
}
