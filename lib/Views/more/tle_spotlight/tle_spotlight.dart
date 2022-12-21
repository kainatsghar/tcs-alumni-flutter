import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/local_db/local_db.dart';

import '../../../Widgets/sec_appbar.dart';
import '../../../Widgets/tle_user_widget.dart';

import '../../../models/data_fetched.dart';
import '../../../networkcalls/api_helper.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_images.dart';
import '../../../utils/strings.dart';
import '../profile_screen.dart';

class TLESpotlight extends StatefulWidget {
  const TLESpotlight({Key? key}) : super(key: key);

  @override
  _TLESpotlightState createState() => _TLESpotlightState();
}

class _TLESpotlightState extends State<TLESpotlight> {
  Future? fetchData;
  late List<DBTleSpotlight> spotList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    spotList = [];

    fetchData = tleSpotlightCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.featuredMembers),
        context: context,
      ),
      body: _bodyContainer(),
    );
  }

  Widget _bodyWithNoUser() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.nospotLight),
            Text(
              'No Users Found',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: AppColor.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Image(
          image: AssetImage(AppImages.spotlightGif),
          fit: BoxFit.fill,
        ),
        FutureBuilder(
            future: fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: EdgeInsets.only(top: 110.h),
                  child: _buildListViewWidget(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }

  Widget _spotlightUsers() {
    return Padding(
      padding: EdgeInsets.only(top: 110.h),
      child: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // if you need this
                    side: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildListViewWidget() {
    return spotList.isEmpty
        ? _bodyWithNoUser()
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            // controller: _scrollController,
            itemCount: spotList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('user id is: *********${spotList[i].userId}');
                      Get.to(
                        () => ProfileScreen(
                          userID: spotList[i].userId,
                        ),
                      );
                      print(spotList[i].chatInvitationStatus);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return ProfileScreen(userID: spotList[i].userId);
                      //     },
                      //   ),
                      // );
                    },
                    child: TleUserWidget(
                      image: spotList[i].image,
                      name: spotList[i].firstName,
                      place: spotList[i].currentCityName ?? '',
                      profession: spotList[i].chapterDesignation != null
                          ? '${spotList[i].chapterDesignation}, ${spotList[i].orgName}'
                          : '',
                      year: '',
                      isMentor: spotList[i].isMentor ?? "0",
                      chatStatus: spotList[i].chatInvitationStatus ?? '',
                      id: spotList[i].userId,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              );
            },
          );
  }

  Future<void> tleSpotlightCall() async {
    DataFetched dataFetched = await ApiHelper.tleSpotlight();
    if (dataFetched.done) {
      print('tle spotlight done bro');
      await dbMethod();
    }
  }

  dbMethod() async {
    spotList = await database.getTleSpotlight();
  }
}
