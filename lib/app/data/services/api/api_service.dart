import 'package:flutter_pos/app/data/services/api/index_connect.dart';
import 'package:flutter_pos/app/data/services/api/login_connect.dart';
import 'package:flutter_pos/app/data/services/ui_service.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  final String _baseUrl = 'https://qualityconnector.com/api';

  final UiService _uiService = UiService();
  final IndexConnect _indexConnect = IndexConnect();
  final LoginConnect _loginConnect = LoginConnect();

  Future<ApiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  void apiErrorHandler(dynamic response, String from) {
    print(response.status.code);
    if (response.status.code == 500) {
      _uiService.errorSnackBar("Error", "Server Error 500");
    }
    if (response.status.code == 404) {
      final String msg = from + " Not Found";
      _uiService.errorSnackBar("Error", msg);
    }
  }

  Future<dynamic> login(Map<String, dynamic> data) async {
    final String url = _baseUrl + '/login';
    final response = await _loginConnect.login(url, data);
    if (response.status.isOk) {
      return response.body;
    } else {
      apiErrorHandler(response, 'Login');
    }
  }

  Future<dynamic> index(String path, String from) async {
    final String url = _baseUrl + path;
    print(url);
    final response = await _indexConnect.index(url);
    if (response.status.isOk) {
      return response.body;
    } else {
      apiErrorHandler(response, from);
    }
  }
}
