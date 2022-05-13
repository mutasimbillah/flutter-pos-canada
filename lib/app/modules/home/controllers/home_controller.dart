import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _apiService = Get.find<ApiService>();

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

  //Call APi
  void getProducts() async {
    dynamic res = await _apiService.index('/product');
    print(res['data']);
  }
}
