import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:geolocator/geolocator.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/controllers/profile_controller.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/intro_screens/into_screen.dart';
import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/response_models/login_entity_entity.dart';

import 'package:iobm/networkcalls/response_models/settings_entity.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/device_data.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../networkcalls/response_models/logout_entity.dart';
import '../utils/notification_manager.dart';
import 'bottom_navigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ProfileController _controller = Get.put(ProfileController());
  Timer? _timer;
  int count = 4;
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
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        print(count);
        if (count > 0) {
          count--;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashimage),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image(
                  height: 63.h,
                  width: 234.w,
                  image: const AssetImage(AppImages.splashLogo),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "ver $versionCode",
                style: TextStyle(
                    color: AppConstants.appName == 'TLE'
                        ? AppColor.black
                        : AppColor.white,
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            // right: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    "Powered by",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    AppImages.viion,
                    height: 25,
                    width: 45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getInfo() async {
    await addData();
    await MessagingManager.initialize();
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
