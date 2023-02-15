import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../utils/text_styles.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  ConnectScreenState createState() => ConnectScreenState();
}

class ConnectScreenState extends State<ConnectScreen> {
  late DBContact _contact;
  bool dataFetched = false;
  bool wait = false;

  Future<void>? _launched;

  void launchEmailSubmission(String path) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: path,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String toLaunch = 'https://ntc-autoparts.com';

  @override
  void initState() {
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getContactDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shape:
              Border(bottom: BorderSide(color: AppColor.secAppBar, width: 3.w)),
          title: Text(
            Strings.connect,
            style: CustomTextStyles.text16SemiBoldW600,
          ),
        ),
        body: dataFetched
            ? _bodyContainer()
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget _bodyContainer() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _alumniAffairs(),
          SizedBox(
            height: 20.h,
          ),
          _follow(),
          SizedBox(
            height: 20.h,
          ),
          // _productOf(),
          SizedBox(
            height: 5.h,
          ),
          Expanded(child: Container()),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ver. $versionCode",
                style: CustomTextStyles.text12RegularW400,
              ),
              Row(
                children: [
                  Text(
                    "Product By",
                    style: CustomTextStyles.text12RegularW400,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launched = _launchInBrowser(AppConstants.linkAlumni);
                    },
                    child: Image(
                      image: const AssetImage(AppImages.linkAlumni),
                      height: 12.h,
                      //        width: 100.w,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _alumniAffairs() {
    return Container(
      decoration: alumniAffairDecoration(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.alumniaffairs,
            style: CustomTextStyles.text14SemiBoldW600,
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              launchEmailSubmission('${_contact.email}');
            },
            child: rowWidget(
              img: AppImages.mail,
              text: _contact.email,
              isUnderling: true,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          rowWidget(
            img: AppImages.fax,
            text: _contact.fax,
            isUnderling: false,
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              _launched = _makePhoneCall('tel:${_contact.phone}');
            },
            child: rowWidgetExt(
              img: AppImages.phone,
              text: _contact.phone,
              isUnderling: true,
              ext: _contact.phoneExt,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (_contact.address != null)
            GestureDetector(
              onTap: () {
                MapsLauncher.launchQuery('${_contact.address}');
              },
              child: rowWidget(
                  img: AppImages.location,
                  text: _contact.address,
                  isUnderling: false),
            ),
          if (_contact.address != null)
            SizedBox(
              height: 10.h,
            ),
          GestureDetector(
            onTap: () {
              _launched = _launchInBrowser("${_contact.website}");
            },
            child: rowWidget(
                img: AppImages.web, text: _contact.website, isUnderling: true),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  Widget rowWidget({
    img,
    text,
    isUnderling,
  }) {
    return Row(
      children: [
        Image(
          image: AssetImage(img),
          height: 16.h,
          width: 16.w,
          color: AppColor.primaryColor,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            text,
            style: CustomTextStyles.text12RegularW400.copyWith(color: isUnderling ? AppColor.primaryColor : AppColor.black,
              decoration:
              isUnderling ? TextDecoration.underline : TextDecoration.none,),
          ),
        )
      ],
    );
  }

  Widget rowWidgetExt({
    img,
    text,
    isUnderling,
    ext,
  }) {
    return Row(
      children: [
        Image(
          image: AssetImage(img),
          height: 16.h,
          width: 16.w,
          color: AppColor.primaryColor,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: CustomTextStyles.text12RegularW400.copyWith(color: isUnderling ? AppColor.primaryColor : AppColor.black,
            decoration:
            isUnderling ? TextDecoration.underline : TextDecoration.none,),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          ext ?? '',
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    );
  }

  _follow() {
    return Container(
      decoration: alumniAffairDecoration(),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Follow us on Social Media:',
              style: CustomTextStyles.text14SemiBoldW600),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _contact.whatsappLink != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          _launchURL("${_contact.whatsappLink}");
                        },
                        child: Image(
                          image: const AssetImage(AppImages.whatsapp),
                          height: 30.h,
                        ),
                      ),
                    )
                  : const SizedBox(),
              _contact.faceBookLink != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils().launchSocial(
                              "fb://profile/104342767870346",
                              _contact.faceBookLink ?? '');
                        },
                        child: Image(
                            image: const AssetImage(AppImages.facebook),
                            height: 30.h),
                      ),
                    )
                  : const SizedBox(),
              _contact.youtubeLink != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils().launchSocial(
                              "fb://profile/104342767870346",
                              _contact.youtubeLink ?? '');
                        },
                        child: Image(
                            image: const AssetImage(AppImages.youtube),
                            height: 30.h),
                      ),
                    )
                  : const SizedBox(),
              _contact.linkedInUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils().launchSocial(
                              "fb://profile/104342767870346",
                              _contact.linkedInUrl ?? '');
                        },
                        child: Image(
                            image: const AssetImage(AppImages.linkedinpng),
                            height: 30.h),
                      ),
                    )
                  : const SizedBox(),
              _contact.instagramLink != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils().launchSocial(
                              "fb://profile/104342767870346",
                              _contact.instagramLink ?? '');
                        },
                        child: Image(
                            image: const AssetImage(AppImages.instagram),
                            height: 30.h),
                      ),
                    )
                  : const SizedBox(),
              _contact.twitterLink != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          AppUtils().launchSocial(
                              "fb://profile/104342767870346",
                              _contact.twitterLink ?? '');
                        },
                        child: Image(
                            image: const AssetImage(AppImages.twitter),
                            height: 30.h),
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _contact = await database.getContact();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getContactDetails() async {
    setState(() {
      wait = true;
    });
    DataFetched dataFetched = await ApiHelper.getContact();
    if (dataFetched.done) {
      setDataFromDB();
    }
    setState(() {
      wait = false;
    });
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Not found $url';
}
