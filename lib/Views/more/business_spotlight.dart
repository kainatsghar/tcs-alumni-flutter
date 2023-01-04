import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Widgets/sec_appbar.dart';
import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';
import '../../utils/app_images.dart';
import '../../utils/strings.dart';

class BusinessSpotlight extends StatefulWidget {
  const BusinessSpotlight({Key? key}) : super(key: key);

  @override
  _BusinessSpotlightState createState() => _BusinessSpotlightState();
}

class _BusinessSpotlightState extends State<BusinessSpotlight> {
  late List<DBBusinessSpotlight> busiList;
  late Future fetchData;

  @override
  void initState() {
    super.initState();
    busiList = [];
    dbMethod();
    fetchData = businessSpotlightCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.businessspotlight),
        context: context,
      ),
      body: _bodyContainer(),
    );
  }

  Widget _bodyContainer() {
    return FutureBuilder(
        future: fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return busiList.isNotEmpty ? Stack(
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
                            return _spotlightUsers();
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ],
                ) : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.featuredBusiness,height: 250.h,width: 250.w,),
                      SizedBox(height: 20.h,),
                      Text('No Featured Business!',style: TextStyle(fontSize: 16.sp,color: AppColor.grey),),
                    ],
                  ),
                );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _spotlightUsers() {
    return Padding(
      padding: EdgeInsets.only(top: 110.h),
      child:  ListView.builder(
              shrinkWrap: true,
              itemCount: busiList.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    _launchInBrowser(busiList[i].clickUrl ?? '');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                            imageUrl: busiList[i].banner ?? '')),
                  ),
                );
              }),
    );
  }

  Future<void> businessSpotlightCall() async {
    DataFetched dataFetched = await ApiHelper.businessSpotlight();
    if (dataFetched.done) {
      print('business done bro');
      print(busiList.first.banner);
      await dbMethod();
      // setDataFromDB();
    }
  }

  dbMethod() async {
    busiList = await database.getBusiSpotlight();
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

}
