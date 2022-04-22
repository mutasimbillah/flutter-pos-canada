import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/data/services/storage_service.dart';
import 'package:flutter_pos/app/data/services/ui_service.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //all service
  await initServices();

  runApp(
    GetMaterialApp(
      title: "POS Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

Future initServices() async {
  print('starting services ...');
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => UiService().init());
  await Get.putAsync(() => ApiService().init());
  //await Get.putAsync(() => FcmService().init());
  //Get.put(() => FcmService().handleBackground());
  print('All services started...');
}
