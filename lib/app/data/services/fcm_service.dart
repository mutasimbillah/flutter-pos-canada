import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/state_manager.dart';

class FcmService extends GetxService {
  //pre-config
  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'flutter_pos_canada', // id
    'flutterfcmpos', // name
    description: 'test description',
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alarm'),
    enableVibration: true,
  );

  //init local notification
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

  handleBackground() {
    //BackGround Handler
    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
  }

  handleForeground() {
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
  }

  Future<FcmService> init() async {
    print('$runtimeType is ready!');

    //init firebase
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    //Token
    handleBackground();
    handleForeground();
    getToken();
    return this;
  }
}
