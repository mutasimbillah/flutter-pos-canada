import 'package:flutter_pos/app/data/services/ui_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UiService uiService = UiService();
  // phone
  final _phone = ''.obs;
  get getPhone => _phone.value;
  void setPhone(String phone) => _phone.value = phone;

  // password
  final _password = ''.obs;
  get getPassword => _password.value;
  void setPassword(String phone) => _password.value = phone;

  void login() {
    final phone = getPhone;
    final password = getPassword;
    if (phone == '' || password == '') {
      //uiService.errorDialog("Error", "Phone and Password Required");
      uiService.errorSnackBar("Error", "Phone and Password Required");
      return;
    }
    Map<String, dynamic> data = {
      "phone": phone,
      "password": password,
    };

    print(data);
  }
}
