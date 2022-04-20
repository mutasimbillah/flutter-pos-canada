import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  String? getToken(String tokenName) {
    return GetStorage().read(tokenName);
  }

  Future<void> saveToken(String tokenName, String? value) async {
    //TODO api check and snackbar
    if (value == null) return;
    await GetStorage().write(tokenName, value);
    print('$tokenName saved');
  }
}
