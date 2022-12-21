import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';

import 'package:iobm/networkcalls/api_helper.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

import 'business_directory_details.dart';

class BusinessDirectory extends StatefulWidget {
  const BusinessDirectory({Key? key}) : super(key: key);

  @override
  _BusinessDirectoryState createState() => _BusinessDirectoryState();
}

class _BusinessDirectoryState extends State<BusinessDirectory> {
  final TextEditingController _searchItems = TextEditingController();
  String keyword = '';

  bool dataFetched = false;

  late List<DBCompanie> _companyList;
  final _random = Random();

  @override
  void initState() {
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getCompanies();
    });

    _searchItems.addListener(() {
      setState(() {
        keyword = _searchItems.text;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.businessdirectory),
          context: context,
        ),
        body: dataFetched
            ? _bodyContainer()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Container(
      color: AppColor.white,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        searchBar(),
        // Divider(
        //   thickness: 1.w,
        //   height: 1.h,
        // ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _companyList.length,
                itemBuilder: (BuildContext context, int i) {
                  if (_companyList[i]
                          .title
                          .toString()
                          .toLowerCase()
                          .contains(keyword.toLowerCase()) ||
                      _companyList[i]
                          .title
                          .toString()
                          .toUpperCase()
                          .contains(keyword.toUpperCase())) {
                    if (_companyList[i].workers != 0) {
                      return rowWidget(
                          img: _companyList[i].image,
                          name: _companyList[i].title,
                          workers: _companyList[i].workers,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return BusinessDirectoryDetail(
                                    name: _companyList[i].title,
                                    image: _companyList[i].image,
                                    companyId: _companyList[i].id,
                                  );
                                },
                              ),
                            );
                          });
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }),
          ),
        )
      ]),
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: 15.h,
        bottom: 10.h,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 25.w,
            color: AppColor.black45,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 30,
              child: TextField(
                style: TextStyle(fontSize: 13.sp),
                // cursorHeight: 18.h,
                controller: _searchItems,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(16),
                    color: AppColor.black38,
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.black12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  rowWidget({img, onTap, String? name, workers}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Material(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.black12,
                  spreadRadius: 0.2,
                  blurRadius: 0.5,
                )
              ],
            ),
            child: ListTile(
              leading: SizedBox(
                height: 50.h,
                width: 50.w,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: img != ""
                      ? CachedNetworkImage(
                          // height: 50.h,
                          // width: 50.w,
                          imageUrl: img,
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                _random.nextInt(256),
                                _random.nextInt(256),
                                _random.nextInt(256),
                                0.8,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                AppUtils().splitText(name!) ?? '',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                              _random.nextInt(256),
                              _random.nextInt(256),
                              _random.nextInt(256),
                              0.8,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              AppUtils().splitText(name!) ?? '',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              title: Text(
                name ?? '',
                style: WidgetStyle.boldFont(fontsize: 14.0.sp),
              ),
              subtitle: Text(
                "$workers fellow here",
                style: const TextStyle(color: AppColor.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _companyList = await database.getCompanies();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getCompanies() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.loadCompanies();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
