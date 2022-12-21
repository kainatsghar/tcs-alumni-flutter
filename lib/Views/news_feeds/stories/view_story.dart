import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';

import 'package:iobm/networkcalls/response_models/add_story_entity.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:story_view/story_view.dart';

import '../../bottom_navigationbar.dart';

class ViewStory extends StatefulWidget {
  final String? url;
  final String? name;
  final String? image;
  final String? userId;
  final String? date;
  final String? storyId;
  const ViewStory(
      {Key? key,
      required this.url,
      this.name,
      this.image,
      this.userId,
      this.date,
      this.storyId})
      : super(key: key);

  @override
  _ViewStoryState createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  final StoryController controller = StoryController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
        url: widget.url ?? '',
        controller: controller,
        duration: const Duration(seconds: 10),
      ),
    ];
    return GestureDetector(
      onVerticalDragEnd: (drag) {
        Get.back();
      },
      child: Scaffold(
        body: Stack(
          children: [
            StoryView(
              storyItems: storyItems,
              onComplete: () {
                Get.back();
              },
              controller: controller,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 5, left: 3).copyWith(top: 45.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColor.white,
                          size: 25.w,
                        ),
                      ),
                      CircleAvatar(
                        child: widget.image == ''
                            ? Image(
                                image: const AssetImage(AppImages.profile),
                                width: 45.w,
                                height: 45.h,
                              )
                            : CachedNetworkImage(
                                imageUrl: widget.image ?? '',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 45.w,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Image(
                                  image: const AssetImage(AppImages.profile),
                                  height: 50.w,
                                  width: 50.h,
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${AppUtils().calculateDifference(widget.date ?? '')}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (widget.userId == AppConstants.myId)
                    PopupMenuButton(
                      onSelected: (value) {
                        if (value == 0) {
                          deleteStory(widget.storyId);
                        }
                        // Get.back();
                      },
                      itemBuilder: (BuildContext context) {
                        return const [
                          PopupMenuItem(
                            value: 0,
                            child: Text('Delete Story'),
                          )
                        ];
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColor.white,
                      ),
                      color: AppColor.white,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSeen() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.seen,
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          'Seen By',
                          style: TextStyle(color: AppColor.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.profile,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('Chris James',
                                  style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('3m ago',
                                  style: TextStyle(
                                      fontSize: 11.sp, color: AppColor.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.profile,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('Chris James',
                                  style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('3m ago',
                                  style: TextStyle(
                                      fontSize: 11.sp, color: AppColor.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImages.profile,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('Chris James',
                                  style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('3m ago',
                                  style: TextStyle(
                                      fontSize: 11.sp, color: AppColor.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Future<void> deleteStory(id) async {
    var response = await ApiCalls.deleteTimelineStory(storyId: id);
    if (response is ErrorEntity) {
    } else {
      AddStoryEntity storyEntity =
          AddStoryEntity.fromJson(jsonEncode(response));
      if (storyEntity.success == 1) {
        Get.offUntil(GetPageRoute(page: () => const BottomNavigationScreen()),
            (route) => false);
      }
    }
  }
}
