import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/user_widget2.dart';
import 'package:iobm/Widgets/user_widget3.dart';

import 'package:iobm/utils/strings.dart';

import '../../local_db/local_db.dart';
import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';
import '../../utils/app_color.dart';

import '../../utils/app_images.dart';

class CampusDetails extends StatefulWidget {
  const CampusDetails({Key? key}) : super(key: key);

  @override
  _CampusDetailsState createState() => _CampusDetailsState();
}

class _CampusDetailsState extends State<CampusDetails> {
  late List<DBChapterDetail> chapDlist;
  late List<DBChapterDetailResult> chapRlist;
  late List<DBChapterDetailMember> chapMlist;
  Future? dataFetch;

  @override
  void initState() {
    chapDlist = [];
    chapRlist = [];
    chapMlist = [];
    print('1');
    dataFetch = campusDetailsCall();
    print('2');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.universityName),
        context: context,
      ),
      body: FutureBuilder(
          future: dataFetch,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  // SizedBox(
                  //   height: 50.h,
                  //   child: Center(
                  //     child: Text(
                  //       chapRlist.first.rChapterName ?? '',
                  //       style: TextStyle(
                  //           color: AppColor.primaryColor, fontSize: 17.sp),
                  //     ),
                  //   ),
                  // ),
                  const Divider(
                    height: 1,
                    color: AppColor.grey,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          _memberListViewWidget(),
                          Container(
                            height: 10,
                            color: AppColor.greyshade100,
                          ),
                          _buildListViewWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget _buildListViewWidget() {
    return chapDlist.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'No Chapters Found',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: AppColor.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chapDlist.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return Userwidget2(
                image: AppImages.campusicon,
                name: chapDlist[i].chapterName ?? '',
                profession: chapDlist[i].address ?? '',
                year: chapDlist[i].contact ?? '',
                head: '',
              );
            },
          );
  }

  Widget _memberListViewWidget() {
    return chapMlist.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'No Members Found',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: AppColor.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chapMlist.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return UserWidget3(
                image: chapMlist[i].mAlumniImage,
                name: chapMlist[i].mAlumniName ?? '',
                profession: chapMlist[i].mAlumniType ?? '',
                year: chapMlist[i].mAlumniContact ?? '',
                isMentor: chapMlist[i].mAlumniName ?? '',
                chatStatus: chapMlist[i].mAlumniName ?? '',
                id: chapMlist[i].mAlumniName ?? '',
                desig: chapMlist[i].mAlumniDesignation ?? '',
              );
            },
          );
  }

  Future<void> setDataFromDB() async {
    chapRlist = await database.getChapResult();
    chapDlist = await database.getChapDetails();
    chapMlist = await database.getChapMembers();

    // print(chapDlist.first.contact);
  }

  Future<void> campusDetailsCall() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.chapterDetails();

    if (dataFetched.done) {
      await setDataFromDB();
      print('done bro chapter details');
    }
  }
}
