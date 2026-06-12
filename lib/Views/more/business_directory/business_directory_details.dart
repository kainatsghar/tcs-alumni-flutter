import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Views/more/profile_screen.dart';
import 'package:iobm/Widgets/sec_appbar.dart';

import 'package:iobm/Widgets/user_widget.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
import 'package:iobm/utils/text_styles.dart';

class BusinessDirectoryDetail extends StatefulWidget {
  final String? name;
  final String? image;
  final String? companyId;
  const BusinessDirectoryDetail(
      {Key? key, this.name, this.image, this.companyId})
      : super(key: key);
  @override
  _BusinessDirectoryDetailState createState() =>
      _BusinessDirectoryDetailState();
}

class _BusinessDirectoryDetailState extends State<BusinessDirectoryDetail> {
  late List<DBAllUser> _employeeList;
  late Future _fetchData;
  int? currentPage;

  @override
  void initState() {
    _employeeList = [];

    _fetchData = getFirstPageUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
          appBar: SecAppBar(
            title: const Text(Strings.businessdirectory),
            context: context,
          ),
          body: _bodyColumn()),
    );
  }

  Widget _bodyColumn() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.27,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage("assets/images/business.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 3,
                left: 15,
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.r),
                        border: Border.all(
                          width: .3,
                          color: AppColor.primaryColor,
                        ),
                        color: AppColor.white,
                      ),
                      child: SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: widget.image != ""
                              ? CachedNetworkImage(
                                  imageUrl: widget.image ?? '',
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                    image: AssetImage(
                                      AppImages.noImage,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                      0.8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppUtils().splitText(widget.name!) ?? '',
                                      style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.white,),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.name ?? '',
                      style: CustomTextStyles.text14SemiBoldW600,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        searchBar(),
        Expanded(
          child: FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _listBuilder();
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  Widget searchBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColor.black26,
          ),
          bottom: BorderSide(
            color: AppColor.black26,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
        top: 4.h,
        bottom: 0.h,
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
                style: CustomTextStyles.text12RegularW400,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.black38,),
                  contentPadding: const EdgeInsets.only(bottom: 10),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.greyshade100,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              size: 25.w,
              color: AppColor.transparent,
            ),
          )
        ],
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
      itemCount: _employeeList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ProfileScreen(
                        userID: _employeeList[i].userId,
                      );
                    },
                  ),
                );
              },
              child: UserWidget(
                image: _employeeList[i].image ?? AppImages.profile,
                name:
                    "${_employeeList[i].firstName} ${_employeeList[i].lastName}",
                place: "${_employeeList[i].currentCityName}",
                organization: _employeeList[i].organizationName ?? '',
                designation: _employeeList[i].designation ?? '',
                year: _employeeList[i].graduationYear ?? "2015",
                isMentor: _employeeList[i].isMentor ?? "0",
                chatStatus: _employeeList[i].chatStatus,
                id: _employeeList[i].userId,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget rowWidget({img, onTap, title, subtitle}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          ListTile(
            leading: SizedBox(
              height: 50.h,
              width: 50.w,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage(img),
              ),
            ),
            title: Text(
              title,
              style: WidgetStyle.boldFont(
                fontsize: ScreenUtil().setSp(14),
              ),
            ),
            subtitle: Text(subtitle),
            trailing: const Image(
              image: AssetImage(
                AppImages.message,
              ),
            ),
          ),
          Divider(
            thickness: 3.h,
            height: 2.h,
            color: AppColor.greyshade200,
          ),
        ],
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _employeeList = await database.getSpecificUsers(
      company: widget.companyId,
      isConnected: "",
      connectionStatus: "",
      name: "",
      industry: "",
      graduationYear: "",
      country: "",
      city: "",
      branch: "",
      isMentor: "",
    );
  }

  Future<void> getFirstPageUsers() async {
    setDataFromDB();

    AllUserDataFetched dataFetched = await ApiHelper.getFirstPageUsers(
      currentPage: 0,
      city: "",
      countryId: "",
      industry: "",
      isMentor: "",
      year: "",
      name: "",
      branchId: "",
      connected: "",
      organization: widget.companyId,
    );

    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
