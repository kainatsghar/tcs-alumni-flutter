import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:package_info_plus/package_info_plus.dart';

class DeviceData {
  String manufacturer = "";
  String model = "";
  String osVersion = "";
  String signupSource = "";
  String platform = "android";
  String serial = "no_serial_found";
  String? token;
  String appVersion = '';
  String packageName = '';

  init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    token = await messaging.getToken();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    packageName = packageInfo.packageName;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      serial = androidInfo.id!;
      manufacturer = androidInfo.manufacturer!;
      model = androidInfo.model!;
      osVersion = androidInfo.version.release!;
      signupSource = "android";
      platform = "android";
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      manufacturer = iosInfo.name!;
      model = iosInfo.model!;
      osVersion = iosInfo.systemVersion!;
      serial = iosInfo.identifierForVendor!;
      signupSource = "iOS";
      platform = "iOS";
    }
  }
}
