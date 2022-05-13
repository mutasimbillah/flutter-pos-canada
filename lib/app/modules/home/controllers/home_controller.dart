import 'package:flutter_pos/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

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

  void addProduct() {
    Get.toNamed(Routes.PRODUCT);
  }
}
