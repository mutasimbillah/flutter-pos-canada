import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/data/services/storage_service.dart';
import 'package:flutter_pos/app/data/services/ui_service.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//pre-config
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'flutter_pos_canada', // id
  'flutterfcmpos', // name
  description: 'test description',
  importance: Importance.max,
  playSound: true,
  sound: RawResourceAndroidNotificationSound('alarm'),
  enableVibration: true,
);

//init
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
//Background
Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    print("play in background");
  }
}

//Print Fcm Token
getToken() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.getToken().then((value) async {
    print("fcmToken => $value");
    //await DeviceModel.getInstance.getInfo(value);
    //await DeviceModel.getInstance.saveDataToFireBase();
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  //BackGround Handler
  FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

  //Foreground Settings for apple
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //Foreground Handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              color: Colors.blue,
              importance: Importance.max,
              playSound: true,
              sound: RawResourceAndroidNotificationSound('alarm'),
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });

  //all service
  await initServices();
  getToken();
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
  await Get.putAsync(() => UiService().init());
  await Get.putAsync(() => ApiService().init());
  print('All services started...');
}
