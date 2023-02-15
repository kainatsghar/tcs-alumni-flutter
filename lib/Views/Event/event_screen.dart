import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/event/event_tabs.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/main_appbar.dart';

import 'package:iobm/Widgets/widget_styles.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';

import '../../utils/text_styles.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final TextEditingController _searchItems = TextEditingController();
  late List<DBEvent> _eventList;
  late Future _fetchData;

  String keyword = '';
  @override
  void initState() {
    _fetchData = getUserEvents();
    _searchItems.addListener(() {
      setState(() {
        keyword = _searchItems.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text(Strings.events),
        context: context,
      ),
      body: FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _bodyColumn();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _bodyColumn() {
    return SafeArea(
      left: true,
      right: true,
      top: true,
      bottom: true,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: _eventList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.event),
                    const SizedBox(height: 10),
                    Text(
                      'No Event in the List',
                      style: CustomTextStyles.text16SemiBoldW600,
                    ),
                  ],
                )
              : Column(
                  children: [
                    _searchbar(),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _eventList.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            if (_eventList[index]
                                    .title
                                    .toString()
                                    .toLowerCase()
                                    .contains(keyword.toLowerCase()) ||
                                _eventList[index]
                                    .title
                                    .toString()
                                    .toUpperCase()
                                    .contains(keyword.toUpperCase())) {
                              return Column(
                                children: [
                                  // Divider(
                                  //   thickness: 1.w,
                                  //   height: 1.h,
                                  // ),
                                  _event(
                                      title: _eventList[index].title,
                                      eventDate:
                                          '${_eventList[index].startDate} - ${_eventList[index].endDate}',
                                      destination: _eventList[index].city,
                                      interestedPeople:
                                          _eventList[index].totalInterested,
                                      image: _eventList[index].image,
                                      onPressed: () {
                                        Get.to(
                                          () => EventTabs(
                                              eventId: _eventList[index].id,
                                              title: _eventList[index].title),
                                        );
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Divider(
                                      thickness: 1.w,
                                      height: .5.h,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  _searchbar() {
    return Container(
      color: AppColor.white,
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Icon(
              Icons.search,
              size: 25.w,
              color: AppColor.black45,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 13.sp),
              cursorHeight: 14.h,
              controller: _searchItems,
              decoration: InputDecoration(
                // prefixIcon:
                //     Icon(Icons.search, size: 25.h, color: Colors.grey),
                hintText: 'Search Event',
                hintStyle: TextStyle(
                    // fontFamily: 'Nunito',
                    fontSize: 16.sp,
                    color: AppColor.black38),
                contentPadding: const EdgeInsets.only(top: 12),
                // border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }

  _event(
      {title,
      eventDate,
      destination,
      image,
      interestedPeople,
      Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: AppColor.white,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //   color: AppColor.white,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => CircleAvatar(
                //profile image
                backgroundColor: AppColor.white,
                backgroundImage: const AssetImage(AppImages.profile),
                radius: 33.r,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    title,
                    style: TextStyle(
                        // fontFamily: 'Nunito',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text('Event  $eventDate',
                      style: WidgetStyle.forgotTExtStyle(
                          color: AppColor.grey,
                          fontSize: ScreenUtil().setSp(12))),
                  const SizedBox(height: 4,),
                  Text('Destination: $destination',
                      style: WidgetStyle.forgotTExtStyle(
                          color: AppColor.grey,
                          fontSize: ScreenUtil().setSp(12))),
                  const SizedBox(height: 4,),
                  Text('$interestedPeople people interested',
                      style: WidgetStyle.forgotTExtStyle(
                          color: AppColor.black,
                          fontSize: ScreenUtil().setSp(12)))
                ]))
          ],
        ),
      ),
    );
  }

  Future<void> getUserEvents() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.getEvents(context);
    if (dataFetched.done) {
      setDataFromDB();
    }
  }

  Future<void> setDataFromDB() async {
    _eventList = await database.getEvents();
  }
}
