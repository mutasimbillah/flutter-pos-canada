import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Error'),
        content: const Text('This is a dialog'),
        actions: [
          OutlinedButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  ApiService apiService = ApiService();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void test(url) {}

  void showNotification() {}
}
