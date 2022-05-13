import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class CartService extends GetxService {
  final count = 0.obs;

  Future<CartService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  void increment() {
    count.value++;
    print('incremented');
  }
}
