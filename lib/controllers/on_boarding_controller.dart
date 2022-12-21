import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/login_screen.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      // Get.offUntil(
      //     GetPageRoute(page: () => const LoginScreen()), (route) => false);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
        AppImages.intro1Illustration, AppConstants.title1, AppConstants.text1),
    OnBoardingInfo(
        AppImages.intro2Illustration, AppConstants.title2, AppConstants.text2),
    OnBoardingInfo(
        AppImages.intro3Illustration, AppConstants.title3, AppConstants.text3)
  ];
}

class OnBoardingInfo {
  final String imageAsset;
  final String title;
  final String description;

  OnBoardingInfo(this.imageAsset, this.title, this.description);
}
