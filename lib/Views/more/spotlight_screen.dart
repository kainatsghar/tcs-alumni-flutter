import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:iobm/utils/text_styles.dart';

import '../../utils/app_color.dart';

class SpotlightScreen extends StatefulWidget {
  const SpotlightScreen({Key? key}) : super(key: key);

  @override
  SpotlightScreenState createState() => SpotlightScreenState();
}

class SpotlightScreenState extends State<SpotlightScreen> {
  late List<DBSpotlightAlumi> _aluminiList;
  DBSpotlightAlumi? alumini;

  bool _dataFetched = false;
  bool alumniAvail = false;

  @override
  void initState() {
    _aluminiList = [];
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getUserInfo();
    });
    //_fetchData = getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.spotlight),
        context: context,
      ),
      body: _aluminiList.isNotEmpty ? _bodyContainer() : _bodyWithNoUser(),
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
        _dataFetched
            ? _spotLightUser()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }

  Widget _bodyWithNoUser() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              AppImages.nospotLight,
              height: 300.h,
              width: 250.w,
            ),
          ),
          // const SizedBox(height: 8,),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: AppColor.primaryColor,
          //     borderRadius: BorderRadius.all(Radius.circular(25)),
          //   ),
          //   height: 30,width: 110,
          //   child: const Center(child: Text('Reload',style: TextStyle(color: AppColor.white,fontSize: 14))),
          // ),
        ],
      ),
    );
  }

  Widget _spotLightUser() {
    return Positioned(
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => ProfileScreen(
              userID: alumini!.userId,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 102.w,
                  height: 102.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 44.r,
                  child: alumini?.image == ''
                      ? const Image(
                    image: AssetImage(AppImages.profile),
                    width: 80,
                    height: 80,
                  )
                      : CachedNetworkImage(
                    imageUrl: alumini?.image ?? '',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage(AppImages.profile),
                      width: 80,
                      height: 80,
                    ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              alumini?.firstName.toString() ?? '',
              style: CustomTextStyles.text14SemiBoldW600,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Class of: ${alumini?.graduationYear}',
              style: CustomTextStyles.text12RegularW400,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getUserInfo() async {
    DataFetched dataFetched = await ApiHelper.getSpotlight();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }

  Future<void> setDataFromDB() async {
    alumini = null;
    _aluminiList = await database.getSportLightAlumini();
    if (_aluminiList.isNotEmpty) {
      alumini = _aluminiList.first;
    }
    print("alumini= $alumini");
    setState(() {
      _dataFetched = true;
    });
  }

}
