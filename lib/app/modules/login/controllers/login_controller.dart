import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/data/services/ui_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UiService uiService = UiService();
  ApiService apiService = ApiService();

  // phone
  final _phone = '01675339460'.obs;
  get getPhone => _phone.value;
  void setPhone(String phone) => _phone.value = phone;

  // password
  final _password = '@m123456'.obs;
  get getPassword => _password.value;
  void setPassword(String phone) => _password.value = phone;

  void login() async {
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

    final response = await apiService.login(data);
    print(response);
  }
}
