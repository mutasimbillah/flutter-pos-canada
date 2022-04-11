import 'package:flutter_pos/app/data/services/api/index_connect.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  final String _baseUrl = 'https://qualityconnector.com/api';

  IndexConnect indexConnect = IndexConnect();

  Future<ApiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  Future<dynamic> index(String path) async {
    final String url = _baseUrl + path;
    print(url);
    final response = await indexConnect.index(url);

    if (response.status.isOk) {
      return response.toString();
    } else {
      print("Error");
      return Future.error(response.statusText!);
    }
  }
}
