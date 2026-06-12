import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iobm/controllers/on_boarding_controller.dart';
import 'package:iobm/utils/app_color.dart';

class IntroScreen extends StatelessWidget {
  final _controller = Get.put(OnBoardingController());

  IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _controller.onBoardingPages[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SvgPicture.asset(
                        _controller.onBoardingPages[index].imageAsset,
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          _controller.onBoardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  children: List.generate(
                    _controller.onBoardingPages.length,
                    (index) => Obx(() {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? AppColor.primaryColor
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: AppColor.primaryColor,
                  onPressed: _controller.forwardAction,
                  child: Obx(() {
                    return Text(
                      _controller.isLastPage ? 'Start' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
