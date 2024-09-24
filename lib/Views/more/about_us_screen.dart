import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

import '../../utils/text_styles.dart';
import 'customexpansiontile.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  bool dataFetched = false;
  late DBAbout _about;

  @override
  void initState() {
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getAboutUs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: Border(bottom: BorderSide(color: AppColor.secAppBar, width: 3.w)),
          backgroundColor: AppColor.primaryColor,
          titleTextStyle: CustomTextStyles.text16SemiBoldW600,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 22.h,
              color: AppColor.white,
            ),
          ),
          title: Text(
            Strings.aboutUs,
            style: TextStyle(
              // //Family: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(15),
            ),
            softWrap: true,
          ),
        ),
        body: dataFetched
            ? _bodyContainer()
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget _bodyContainer() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _aboutCard(),
          _message(),
          _mission(),
          _vision(),
          _objective(),
        ],
      ),
    );
  }

  Widget _aboutCard() {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        Strings.aboutUni,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // To be shown in BOSS
                /*     Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: AppImages.chiefImage,
                    height: 180.h,width: 120.w,
                    // errorWidget: (context, url, error) =>,
                  ),
                ),*/
                // const Image(
                //   image: AssetImage('assets/images/abt.png'),
                // ),
                // SizedBox(height: 10.h),
                // Center(
                //     child: Text(
                //   'Kasim Kasuri',
                //   style:
                //       TextStyle(fontSize: 15.sp, color: AppColor.primaryColor),
                // )),
                // SizedBox(
                //   height: 10.h,
                // ),
                HtmlWidget(
                  AppUtils().htmlString(_about.aboutMessage ?? ''),
                  textStyle: TextStyle(fontSize: ScreenUtil().setSp(13), color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _message() {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        Strings.message,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: HtmlWidget(
              AppUtils().htmlString(_about.message ?? ''),
              textStyle: TextStyle(fontSize: ScreenUtil().setSp(13), color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mission() {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        Strings.mission,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: HtmlWidget(
              AppUtils().htmlString(_about.mission ?? ''),
              textStyle: TextStyle(fontSize: ScreenUtil().setSp(13), color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _vision() {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        Strings.vision,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: HtmlWidget(
              AppUtils().htmlString(_about.vission ?? ''),
              textStyle: TextStyle(fontSize: ScreenUtil().setSp(13), color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _objective() {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        Strings.objective,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: HtmlWidget(
              AppUtils().htmlString(_about.objective ?? ''),
              textStyle: TextStyle(fontSize: ScreenUtil().setSp(13), color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> setDataFromDB() async {
    _about = await database.getAbout();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getAboutUs() async {
    DataFetched dataFetched = await ApiHelper.getAbout();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
