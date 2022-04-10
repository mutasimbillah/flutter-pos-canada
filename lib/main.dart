import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/api_service.dart';
import 'package:flutter_pos/app/data/services/storage_service.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future initServices() async {
  print('starting services ...');
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => ApiService().init());
  print('All services started...');
}
