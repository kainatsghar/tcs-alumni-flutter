import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/intro_screens/into_screen.dart';
import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/response_models/login_entity_entity.dart';

import 'package:iobm/networkcalls/response_models/settings_entity.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/device_data.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../networkcalls/response_models/logout_entity.dart';
import '../utils/app_color.dart';
import '../utils/app_images.dart';
import '../utils/notification_manager.dart';
import '../utils/text_styles.dart';
import 'bottom_navigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ProfileController _controller = Get.put(ProfileController());
  MessagingManager notificationServices = MessagingManager();
  Timer? _timer;
  int _count = 2;
  String? sharingLocation;
  double? latitude;
  double? longitude;
  String? userId;
  String? email;
  String? password;
  String? loginWith;
  String? loginStatus;
  String? checkStatus;
  String? token;
  var isFirst;

  @override
  void initState() {
    notificationServices.requestPermission();
    notificationServices.firebaseOnMessage();
    notificationServices.setupInteractMessage();
    notificationServices.getDeviceToken().then((value){if (kDebugMode) {
      print('\x1B[33m FCM Token: $value\x1B[0m');
    }});
    _timer = Timer.periodic(
      const Duration(milliseconds: 2500),

      (timer) {
        checkForUpdate();
        if (kDebugMode) {
          print(_count);
        }
        if (_count > 0) {
          _count--;
        } else {
          checkRoutes();
        }
      },
    );
    _getInfo();

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  Future<void> checkForUpdate() async {
    if (Platform.isAndroid) {
      try {
        AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

        print("================================");
        print("Update Availability: ${updateInfo.updateAvailability}");
        print("Immediate Allowed: ${updateInfo.immediateUpdateAllowed}");
        print("Flexible Allowed: ${updateInfo.flexibleUpdateAllowed}");
        print("Available Version Code: ${updateInfo.availableVersionCode}");
        print("Install Status: ${updateInfo.installStatus}");
        print("Package Name: ${updateInfo.packageName}");
        print("================================");

        if (updateInfo.updateAvailability ==
            UpdateAvailability.updateAvailable) {

          if (updateInfo.immediateUpdateAllowed) {

            print("Immediate Update Triggered");

            await InAppUpdate.performImmediateUpdate();

          } else if (updateInfo.flexibleUpdateAllowed) {

            print("Flexible Update Triggered");

            await InAppUpdate.startFlexibleUpdate();
            await InAppUpdate.completeFlexibleUpdate();
          }
        } else {
          print("No Update Available");
        }

      } catch (e) {
        print("In-App Update Error: $e");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: const Color(0Xff1F2D65),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(70),
              // height: Get.height,width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                // image: DecorationImage(
                //   image: AssetImage(
                //     "assets/cityzen-alumni-splash.gif",
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Center(
                child: Image.asset(AppImages.tcsLogo),
              ),
              // child: null /* add child content here */,
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Text("Ver: $versionCode", style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),))
          ],
        ),
      ),
    );
  }

  Future<void> _getInfo() async {
    await addData();
    // await MessagingManager.initialize();
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    setState(() {
      sharingLocation = localStorage.getString('sharingLoc');
      loginWith = localStorage.getString('loginWith');
      latitude = localStorage.getDouble('lat');
      longitude = localStorage.getDouble('lng');
      userId = localStorage.getString('user_id');
      email = localStorage.getString('email');
      password = localStorage.getString('password');
      isFirst = localStorage.getBool('is_first') ?? true;
      loginStatus = localStorage.getString('loginStatus');
      token = localStorage.getString('token');
    });

    if (loginStatus == null || loginStatus == '0') {
      setState(() {
        checkStatus = '0';
      });
    } else {
      getLogin();
    }
  }

  void getLogin() async {
    if (sharingLocation == "1") {
      print("checking location");
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always ||
          permission == LocationPermission.unableToDetermine) {
        Position? position =
            await GeolocatorPlatform.instance.getLastKnownPosition();
        print('Permission granted');
        setState(() {
          latitude = position?.latitude;
          longitude = position?.longitude;
        });
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setDouble('lat', latitude ?? 31.1644654);
        localStorage.setDouble('lng', longitude ?? 74.51354);
      }
    }
    print(latitude);
    print(longitude);
    print(sharingLocation);
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none) {
      AppConstants.myId = userId ?? '';
      AppConstants.bearerToken = token ?? '';
      setState(() {
        checkStatus = '1';
      });
    } else {
      _loginCall(
        email: email ?? '',
        password: password ?? '',
        loginWith: loginWith ?? 'email',
      );
    }
  }

  void _loginCall(
      {required String loginWith,
      required String email,
      required String password}) async {
    DeviceData device = DeviceData();
    await device.init();

    var response = await ApiCalls.login(
      email: email,
      password: password,
      loginWith: loginWith,
      latitude: latitude.toString(),
      longitude: longitude.toString(),
      manufacturer: device.manufacturer,
      model: device.model,
      platform: device.platform,
      osVersion: device.osVersion,
      token: device.token,
      serial: device.serial,
      appVersion: device.appVersion,
    );
    print("Done");

    if (response is ErrorEntity) {
      if (response.success == 403 || response.success == 404) {
        logout();
        setState(() {
          checkStatus = '0';
        });
      } else if (response.success == 500) {
        AppConstants.myId = userId ?? '';
        AppConstants.bearerToken = token ?? '';
        setState(() {
          checkStatus = '1';
        });
      } else {
        setState(() {
          checkStatus = '0';
        });
      }
    } else {
      LoginEntityEntity loginEntity = LoginEntityEntity().fromJson(response);

      if (loginEntity.success == 1) {
        setState(() {
          checkStatus = '1';
        });
        storeSessionData(loginEntity);
      } else if (loginEntity.success == -4) {
        storeSessionData(loginEntity);
        UIHelper.showOptionalUpdateAlert(
          context,
          loginEntity.message,
        );
      } else if (loginEntity.success == -5) {
        UIHelper.showForceUpdateAlert(context);
      } else {
        logout();
        setState(() {
          checkStatus = '0';
        });
      }
    }
  }

  Future<void> addData() async {
    var response = await ApiCalls.signupSettings();
    if (response is ErrorEntity) {
    } else {
      SettingsEntity settingsEntity = SettingsEntity().fromJson(response);
      if (settingsEntity.success == 1) {
        print('olla ');
        await database.deleteAllBranches();
        await database.deleteAllCountries();
        await database.deleteAllDegrees();
        await database.deleteAllIndustries();
        await database.deleteAllReportTypes();
        database.insertAllBranches(
            settingsEntity.result!.branches ?? <DBBranche>[]);
        database.insertAllCountries(
            settingsEntity.result!.countries ?? <DBCountrie>[]);
        database.insertAllIndustries(
            settingsEntity.result!.industries ?? <DBIndustrie>[]);
        database
            .insertAllDegrees(settingsEntity.result!.degrees ?? <DBDegree>[]);
        database.insertAllReportTypes(
            settingsEntity.result!.reportTypes ?? <DBReportType>[]);
        print('olla laaaa');
      }
    }
  }

  storeSessionData(LoginEntityEntity loginEntity) async {
    if (loginEntity.result!.isVerified == '1') {
      AppConstants.myId = loginEntity.result!.userId ?? '';
      AppConstants.userName = loginEntity.result!.firstName ?? '';
      AppConstants.chapterId = loginEntity.result!.chapterId ?? '';
      AppConstants.bearerToken = loginEntity.result!.token ?? '';

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('email', loginEntity.result!.email ?? '');
      localStorage.setString('password', password ?? '');
      localStorage.setString('loginWith', loginWith ?? '');
      localStorage.setString('firstName', loginEntity.result!.firstName ?? '');
      localStorage.setString('lastName', loginEntity.result!.lastName ?? '');
      localStorage.setString(
          'selectedIndustry', loginEntity.result!.industryName ?? '');
      localStorage.setString(
        'userImage',
        loginEntity.result!.image ?? '',
      );
      localStorage.setString(
        'count',
        loginEntity.unreadCount ?? '',
      );
      localStorage.setString(
          'currentCity', loginEntity.result!.currentCityName ?? '');
      localStorage.setString(
          'sharingLoc', loginEntity.result!.isSharingLoc ?? '');
      localStorage.setString('user_id', loginEntity.result!.userId ?? '');
      localStorage.setString('token', loginEntity.result!.token ?? '');

      DBAllUser allUser = DBAllUser(
        userId: loginEntity.result!.userId,
        firstName: loginEntity.result!.firstName,
        lastName: loginEntity.result!.lastName,
        description: loginEntity.result!.description,
        designation: loginEntity.result!.designation,
        branchName: loginEntity.result!.branchName,
        organizationName: loginEntity.result!.organizationName,
        email: loginEntity.result!.email,
        currentCityName: loginEntity.result!.currentCityName,
        isMentor: loginEntity.result!.isMentor,
        isVerified: loginEntity.result!.isVerified,
        connectionStatus: loginEntity.result!.connectionStatus,
        image: loginEntity.result!.image,
        graduationYear: loginEntity.result!.graduationYear,
        chatStatus: loginEntity.result!.chatInvitationStatus,
        linkedinUrl: loginEntity.result!.userLinkedinUrl,
        sharingLoc: loginEntity.result!.isSharingLoc,
        industryName: loginEntity.result!.industryName,
        companyId: loginEntity.result!.companyId,
        branchId: loginEntity.result!.branchId,
      );
      database.insertUser(allUser);
      _controller.getInfo();
    } else {
      logout();
      setState(() {
        checkStatus = '0';
      });
    }
  }

  void logout() async {
    DeviceData device = DeviceData();
    await device.init();

    var response = await ApiCalls.logout(
      userId: AppConstants.myId,
      manufacturer: device.manufacturer,
      model: device.model,
      platform: device.platform,
      osVersion: device.osVersion,
      token: device.token,
      serial: device.serial,
      appVersion: device.appVersion,
    );
    if (response is ErrorEntity) {
    } else {
      LogoutEntity logoutEntity = LogoutEntity().fromJson(response);
      if (logoutEntity.success == 1) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        database.deleteTimeLinePosts();
        database.deleteTimeLinePostImages();
        database.deleteAllUsers();
        database.deleteAllEducations();
        database.deleteAllComments();
        database.deleteAllInterests();
        database.deleteGalleries();
        database.deleteGalleryImages();
        database.deleteAllComments();
        database.deleteCompanies();
        database.deleteNotifications();

        localStorage.remove('email');
        localStorage.remove('password');
        localStorage.remove('loginWith');
        localStorage.remove('email');
        localStorage.remove('userImage');
        localStorage.remove('last_sync');
        localStorage.remove('sharingLoc');
        localStorage.remove('count');
        localStorage.remove("currentCity");
        localStorage.remove("selectedIndustry");
        localStorage.remove('lat');
        localStorage.remove('lng');

        localStorage.remove('loginStatus');
        localStorage.remove('token');

        // Get.offUntil(
        //     GetPageRoute(page: () => const LoginScreen()), (route) => false);
      }
    }
  }

  void checkRoutes() {
    if (checkStatus == '0' && isFirst) {
      Get.offUntil(GetPageRoute(page: () => IntroScreen()), (route) => false);
    } else if (checkStatus == '0') {
      Get.offUntil(
          GetPageRoute(page: () => const LoginScreen()), (route) => false);
    } else if (checkStatus == '1') {
      Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
          (route) => false);
    }
  }

}
