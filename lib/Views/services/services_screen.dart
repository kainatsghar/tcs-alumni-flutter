import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/app_bar.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/strings.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      appBar: MyAppBar(
        title: const Text(
          Strings.services,
        ),
        context: context,
      ),
      body: _bodyContainer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          // Get.to(
          //       () => const AddProductScreen(
          //     productId: "",
          //   ),
          // )!
          //     .then((value) => setDataFromDB());
        },
      ),
    ));
  }

  Widget _bodyContainer() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          _tabBar(),
          Expanded(
            child: SizedBox(
              child: TabBarView(
                children: [
                  _allServicesWidget(),
                  _myServicesWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.black12, width: 2),
        ),
      ),
      child: TabBar(
        indicatorColor: AppColor.primaryColor,
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w400,
          fontFamily: 'Gotham',
        ),
        labelColor: AppColor.primaryColor,
        unselectedLabelColor: AppColor.grey,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: 'All Services'),
          Tab(text: 'My Services'),
        ],
      ),
    );
  }

  Widget _allServicesWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    height: 100.h,
                    width: 80.w,
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAQ0lJzJFMQ7rxo9LQj2v5OqMYlz7H0FatSg&usqp=CAU',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        strokeWidth: 1.5,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage(
                        AppImages.noImage,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Battery Replacement',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Battery replacement is offered at no charge for phone purchased at IWC',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.black38,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14.r,
                            color: AppColor.black38,
                          ),
                          Text(
                            'Link Road Model Town Lahore',
                            style: TextStyle(
                              color: AppColor.black38,
                              fontSize: ScreenUtil().setSp(12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 13.r,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '12-04-2022',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _myServicesWidget() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container();
        },
      ),
    );
  }
}
