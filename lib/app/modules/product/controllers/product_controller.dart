import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/data/services/api/models/http_200.dart';
import 'package:flutter_pos/app/modules/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final _apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// data Loading
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  void toggleProductLoader() => _isLoading.value = !_isLoading.value;

  /// Product List
  final products = <Product>[].obs;
  void setProducts(data) {
    for (var element in data) {
      products.add(Product.fromJson(element));
    }
  }

  //Call APi
  void getProducts() async {
    dynamic res = await _apiService.index('/product');
    if (res['success'] == true) {
      setProducts(res['data']);
    }
  }
}
