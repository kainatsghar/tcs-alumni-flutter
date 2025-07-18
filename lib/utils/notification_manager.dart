import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Views/Chat/send_invation_screen.dart';
import '../Views/login_screen.dart';
import '../controllers/profile_controller.dart';
import 'package:http/http.dart' as http;

import '../networkcalls/api_path.dart';
import '../networkcalls/network_config.dart';
import 'app_constants.dart';
const String _PayLoadPrefix = "notificationId";

class MessagingManager {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final ProfileController profileController = Get.put(ProfileController());

  void requestPermission() async{
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('\x1B[33mUser granted permission\x1B[0m');
      }
    }
    else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('\x1B[33mUser granted provisional permission\x1B[0m');
      }
    }
    else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      // AppSettings.openNotificationSettings();
    }

  }

  void initLocalNotification(RemoteMessage message) async{
    var androidInitializationSetting = const AndroidInitializationSettings("@drawable/ic_notification");
    DarwinInitializationSettings iosInitializationSetting = const DarwinInitializationSettings();

    var initialization = InitializationSettings(
        android: androidInitializationSetting,
        iOS: iosInitializationSetting
    );

    flutterLocalNotificationsPlugin.initialize(
      initialization,
      onDidReceiveNotificationResponse: (payload){
        print('\x1B[33m payload= $payload\x1B[0m');
        handleMessage(message);
      },
    );
  }

  Future<String> getDeviceToken() async {
    try {
      if (Platform.isIOS) {
        String? apnsToken = await firebaseMessaging.getAPNSToken();
        print("***APNS Token: $apnsToken");

        if (apnsToken == null) {
          await Future.delayed(const Duration(seconds: 3));
          apnsToken = await firebaseMessaging.getAPNSToken();
        }

        if (apnsToken != null) {
          await firebaseMessaging.subscribeToTopic("TCSALUMNI");
        }

        String? fcmToken = await firebaseMessaging.getToken();
        print("***FCM Token: $fcmToken");
        return fcmToken ?? "Empty FCM Token";
      }
      else {
        String? fcmToken = await firebaseMessaging.getToken();
        print("***FCM Token: $fcmToken");
        return fcmToken ?? "Empty FCM Token";
      }
    } catch (err) {
      print("***Error retrieving token: $err");
      String? fallbackToken = await firebaseMessaging.getToken();
      print("***Fallback FCM Token: $fallbackToken");
      return fallbackToken ?? "Empty FCM Token";
    }
  }

  firebaseOnMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print('\x1B[33m Message= ${message.data["notification_type"]}\x1B[0m');
      }
      initLocalNotification(message);
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    if(message.data["title"] == "New message"){
      profileController.updateFirebaseCount();
    }
    counterCall();
    final String largeIconPath = await _downloadAndSaveFile(
      message.data["image"] ?? "https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png",
      'largeIcon',
    );

    print('\x1B[33m Channel Id: ${Random.secure().nextInt(100000).toString()}\x1B[0m');
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(), //channel id
        'High Importance Notifications', //channel name
        importance: Importance.max, // agr ye max ni hogi to show ni hogi notification front pr active app me
        sound: const RawResourceAndroidNotificationSound("whistle"),
        playSound: true
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);


    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString() ,
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high ,
      ticker: 'ticker',
      playSound: true,
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      // styleInformation:  BigPictureStyleInformation(
      //   FilePathAndroidBitmap(""),
      //   largeIcon: FilePathAndroidBitmap(largeIconPath),
      //   hideExpandedLargeIcon: true,
      // ),
      sound: const RawResourceAndroidNotificationSound("whistle"),
    );

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
        presentAlert: true ,
        presentBadge: true ,
        presentSound: true
    );

    //All detail initialized
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );

    Future.delayed(Duration.zero , (){
      flutterLocalNotificationsPlugin.show(
          0, //id
          message.data["title"],
          message.data["body"],
          notificationDetails //for android and ios
      );
    });

  }

  Future<void> setupInteractMessage() async{

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    print('\x1B[33m Interaction entered\x1B[0m');

    if(initialMessage != null){
      handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(event);
    });

  }

  void handleMessage(RemoteMessage message) async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print('\x1B[33m Handle Click= ${message.data["image"]}\x1B[0m');
    }
    if(message.data.isNotEmpty){
      String? username = localStorage.getString("email")??"";
      if(username.isNotEmpty){
        Get.to(() => ChatInvitationScreen(
          image: message.data["image"],
          receiverId: message.data["receiverId"],
          name: message.data["name"],
          fromNotification: "yes",
        ));
      }
      else{
        Get.to(()=> LoginScreen(comeFromNotification: "yes",fromNotification: "yes",image: message.data["image"],
          receiverId: message.data["receiverId"],
          name: message.data["name"],));
      }
    }

    // Navigator.pushNamed(context, '/chat',
    //   arguments: ChatInvitationScreen(
    //     image: message.data["image"],
    //     receiverId: message.data["receiverId"],
    //     name: message.data["name"],
    //     fromNotification: "yes",
    //   ),
    // );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory? directory = await getExternalStorageDirectory();
    final String filePath = '${directory!.path}/$fileName.png';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> showBgNotification(RemoteMessage message) async {
    final String largeIconPath = await _downloadAndSaveFile(
      message.data["image"],
      'largeIcon',
    );

    print('\x1B[33m Channel Id: ${Random.secure().nextInt(100000).toString()}\x1B[0m');
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(), //channel id
      'High Importance Notifications', //channel name
      importance: Importance.max, // agr ye max ni hogi to show ni hogi notification front pr active app me
      sound: const RawResourceAndroidNotificationSound("whistle"),
      playSound: true,

    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);


    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      playSound: true,
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      // styleInformation:  BigPictureStyleInformation(
      //   FilePathAndroidBitmap(""),
      //   largeIcon: FilePathAndroidBitmap(largeIconPath),
      //   hideExpandedLargeIcon: true,
      // ),
      sound: const RawResourceAndroidNotificationSound("whistle"),
    );

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
        presentAlert: true ,
        presentBadge: true ,
        presentSound: true
    );
    initLocalNotification(message);
    //All detail initialized
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );
    Future.delayed(Duration.zero , (){
      flutterLocalNotificationsPlugin.show(
          0, //id
          message.data["title"],
          message.data["body"],
          notificationDetails //for android and ios
      );
    });

  }

  checkAppLaunch() async{
    var androidInitializationSetting = const AndroidInitializationSettings("@drawable/ic_notification");
    DarwinInitializationSettings iosInitializationSetting = const DarwinInitializationSettings();

    var initialization = InitializationSettings(
        android: androidInitializationSetting,
        iOS: iosInitializationSetting
    );

    flutterLocalNotificationsPlugin.initialize(initialization);
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    print("BG Notification : ${notificationAppLaunchDetails!.didNotificationLaunchApp}");
  }

counterCall() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String url = AppConstants.baseUrl + apiCounter;
  ApiResponse response = await NetworkConfig.getWebCallWithToken(url);
  if(response.done ?? false){
    dynamic count = jsonDecode(response.responseString??"")["count"];
    if (kDebugMode) {
      print("count= $count");
    }
    preferences.setString(
      'count',
      count,
    );
    Get.find<ProfileController>().getInfo();
  }
}

}
