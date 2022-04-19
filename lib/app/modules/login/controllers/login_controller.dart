import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  // phone
  final _phone = ''.obs;
  get getPhone => _phone.value;
  void setPhone(String phone) => _phone.value = phone;
  // password
  final _password = ''.obs;
  get getPassword => _password.value;
  void setPassword(String phone) => _password.value = phone;
}
