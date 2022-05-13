import 'package:flutter_pos/app/modules/product/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
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

  /// data Loading
  final _isLoading = true.obs;
  get productLoader => _isLoading.value;
  void toggleProductLoader() => _isLoading.value = !_isLoading.value;

  /// Product List
  final _products = <Product>[].obs;
  get products => _products;
  //
  void setProducts(data) {
    for (var element in data) {
      _products.add(Product.fromJson(element));
    }
  }

  //Call APi
  void getProducts() {}
}
