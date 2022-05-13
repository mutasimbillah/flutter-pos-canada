import 'package:flutter_pos/app/data/models/user_model.dart';
import 'package:flutter_pos/app/data/services/api/connects/index_connect.dart';
import 'package:flutter_pos/app/data/services/api/connects/login_connect.dart';
import 'package:flutter_pos/app/data/services/ui_service.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  final String _baseUrl = 'https://qualityconnector.com/api';

  final _uiService = Get.find<UiService>();
  final IndexConnect _indexConnect = IndexConnect();
  final LoginConnect _loginConnect = LoginConnect();

  Future<ApiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  void apiErrorHandler(dynamic response, String from) {
    //TODO Check internet
    print(response.status.code);
    if (response.status.code == 500) {
      _uiService.errorSnackBar("Error", "Server Error 500");
    }
    if (response.status.code == 404) {
      final String msg = from + " Not Found";
      _uiService.errorSnackBar("Error", msg);
    }
  }

  Future<dynamic> index(String path) async {
    final String url = _baseUrl + path;
    final String from = path.substring(1);
    //print(from);
    final response = await _indexConnect.index(url);
    //print(response.status.isOk);
    if (response.status.isOk) {
      return response.body;
    } else {
      apiErrorHandler(response, from);
    }
  }

  //user login
  Future<dynamic> login(Map<String, dynamic> data) async {
    final String url = _baseUrl + '/login';
    final response = await _loginConnect.login(url, data);
    if (response.status.isOk) {
      return response.body;
    } else {
      apiErrorHandler(response, 'Login');
    }
  }

  //Customer list
  Future<List<UserModel>> getCustomers(filter) async {
    final response = await index("/customer");
    final data = response["data"];
    //print(data);
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}
