import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/controllers/feeling_controller.dart';
import 'package:iobm/utils/app_color.dart';

class FeelingsDialog extends StatefulWidget {
  const FeelingsDialog({Key? key}) : super(key: key);

  @override
  State<FeelingsDialog> createState() => _FeelingsDialogState();
}

class _FeelingsDialogState extends State<FeelingsDialog> {
  final FeelingController _feelingController = Get.find();

  late Future _fetchData;

  @override
  void initState() {
    // TODO: implement initState
    _fetchData = _feelingController.getFeelings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: Center(
        child: Material(
          color: AppColor.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300.w,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'How are you feeling?',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => _feelingController.feelingName.toString() != ''
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        height: 25.w,
                                        width: 25.w,
                                        imageUrl: _feelingController.feelingIcon
                                            .toString(),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        _feelingController.feelingName
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: ScreenUtil().setSp(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                      _feelingController.selectFeeling(
                                          '', '', '');
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 22.w,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    FutureBuilder(
                      future: _fetchData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Obx(
                            () => SizedBox(
                              height: 300.h,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, mainAxisExtent: 60),
                                itemCount: _feelingController.feelings.length,
                                itemBuilder: (BuildContext context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.back();
                                      _feelingController.selectFeeling(
                                          _feelingController
                                              .feelings[index].feeling,
                                          _feelingController
                                              .feelings[index].emoji,
                                          _feelingController.feelings[index].id
                                              .toString());
                                    },
                                    splashColor: Colors.grey,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.greyshade300,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          CachedNetworkImage(
                                            height: 25.w,
                                            width: 25.w,
                                            imageUrl: _feelingController
                                                    .feelings[index].emoji ??
                                                '',
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            _feelingController
                                                    .feelings[index].feeling ??
                                                '',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 300.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
