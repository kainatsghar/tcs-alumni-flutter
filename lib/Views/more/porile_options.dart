import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/Views/more/update_password_screen.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/logout_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/device_data.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_screen.dart';

class ProfileOptionsView extends StatelessWidget {
  const ProfileOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.profile),
        context: context,
      ),
      body: Column(
        children: [
          _buildMoreItem(
            title: Strings.myprofile,
            icon: AppImages.profileMenu,
            onClicked: () {
              Get.to(() => ProfileScreen(
                    userID: AppConstants.myId,
                  ));
            },
          ),
          Divider(
            height: 1.h,
          ),
          _buildMoreItem(
              title: 'Update Password',
              icon: AppImages.lock,
              onClicked: () {
                Get.to(() => const UpdatePassword());
              }),
          Divider(
            height: 1.h,
          ),
          ListTile(
            minVerticalPadding: 10.h,
            contentPadding: const EdgeInsets.only(left: 10.0),
            title: Row(
              children: [
                Icon(Icons.logout, color: AppColor.redshade900, size: 22.h),
                SizedBox(
                  width: 12.w,
                ),
                Text('Logout',
                    style: TextStyle(
                      // //Family: 'Nunito',
                      color: AppColor.redshade900,
                      fontSize: 15.sp,
                    )),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 22.h,
              color: AppColor.black,
            ),
            onTap: () {
              logout(context);
            },
            dense: true,
          )
          //jobDetailsWidget(title: 'My Profile'),
        ],
      ),
    );
  }

  _buildMoreItem({
    String? title,
    String? icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      minVerticalPadding: 10.h,
      hoverColor: AppColor.primaryColor,
      contentPadding: const EdgeInsets.only(left: 10.0),
      title: Row(
        children: [
          //  Icon(icon, color: AppColor.black, size: 22.0),
          ImageIcon(
            AssetImage(icon!),
            size: 22.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(title!,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(15),
              )),
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 22.h,
        color: AppColor.black,
      ),
      onTap: onClicked,
      dense: true,
    );
  }

  void logout(context) async {
    DeviceData device = DeviceData();
    await device.init();
    UIHelper.apiCallingAlert(context);

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
    UIHelper.hideApiCallingAlert(context);
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
        database.deleteAllProducts();
        database.deleteAllProductImages();
        database.deleteAllTimeLineStories();

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

        Get.offUntil(
          GetPageRoute(page: () => const LoginScreen()),
          (route) => false,
        );
      }
    }
  }
}
