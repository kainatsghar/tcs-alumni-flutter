import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String _PayLoadPrefix = "notificationId";

class MessagingManager {
  static FirebaseMessaging? messaging;

  MessagingManager._();

  static Future<void> initialize() async {
    // Init FCM
    messaging = FirebaseMessaging.instance;
    messaging!.setForegroundNotificationPresentationOptions(
        alert: true, sound: true, badge: true);
    await messaging!.setAutoInitEnabled(true);
    var notificationSettings = await messaging!.requestPermission();
    if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      print('permission granted');
    }

    await FlutterLocalNotificationsPlugin().initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("ic_notification"),
        iOS: DarwinInitializationSettings(),
      ),
      //onSelectNotification: onSelectNotification,
    );

    // FirebaseMessaging.onMessage.listen(onMessage);

    FirebaseMessaging.onBackgroundMessage(onMessage);

    onMessage(await messaging!.getInitialMessage() ?? const RemoteMessage());
  }

  static Future<bool> isInitialMessageIsNotNull() async {
    messaging ??= FirebaseMessaging.instance;
    var initialMessage = await messaging!.getInitialMessage();
    return initialMessage != null;
  }
}

Future<void> onMessage(RemoteMessage message) async {
  print('message received');
  //if (message?.data == null) return;
  //controller.increment();
  showNotification(message);
}

void showNotification(RemoteMessage notification) async {
  if (notification == null) return;
  if (notification.notification == null) return;

  String title = notification.notification!.title ?? '';
  String body = notification.notification!.body ?? '';

  int id = Random().nextInt(10000);

  if (title != null) {
    print(title + "dafjdsakljfaksd");
    if (notification.notification!.android != null) {
      await FlutterLocalNotificationsPlugin().show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "TLE Notifications",
            "TLE Notifications",
            enableVibration: true,
            enableLights: true,
            importance: Importance.high,
            playSound: true,
          ),
        ),
        payload: "$_PayLoadPrefix:$id",
      );
    }
  }
}
