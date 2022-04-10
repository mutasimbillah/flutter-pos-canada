import 'dart:ffi';

import 'package:get/state_manager.dart';

class ApiService extends GetxService {
  final String baseUrl = 'https://mbill.dev/api';
  Future<ApiService> init() async {
    print('$runtimeType is ready!');
    return this;
  }

  Future<dynamic> index(String path) async {
    return [1, 2];
  }
}
