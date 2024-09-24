import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/splash_screen.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/notification_manager.dart';
import 'package:iobm/utils/text_styles.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

String versionCode = '0.0.0';
String packageName = '';
late SharedPreferences preferencesFromMain;

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  versionCode = packageInfo.version;
  packageName = packageInfo.packageName;
  preferencesFromMain = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if(!kDebugMode){
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  //region Firebase Notification
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // var token =  await messaging.getToken();
  // print("firebase fcm token= $token");
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  //endregion

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  HttpOverrides.global = MyHttpoverrides();

  runApp(
    const MyApp(),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  MessagingManager messagingManager = MessagingManager();
  messagingManager.showBgNotification(message);

  print("Handling a background message: ${message.messageId}");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => Portal(
        child: GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: AppConstants.appFontFamily,
            primaryColor: AppColor.primaryColor,
            primarySwatch: AppColor.primaryColor,
            platform: TargetPlatform.iOS,
            appBarTheme: AppBarTheme(backgroundColor: AppColor.primaryColor, titleTextStyle: CustomTextStyles.text16SemiBoldW600, iconTheme: const IconThemeData(color: Colors.white)),
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: AppColor.primaryColor,
            ),
          ),
          //home: const LoginScreen(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
