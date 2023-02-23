import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/Event/avent_attendies_screen.dart';
import 'package:iobm/Views/Event/event_discussion_screen.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/networkcalls/response_models/event_like_entity.dart';
import 'package:iobm/networkcalls/response_models/event_status_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
import 'package:share/share.dart';

import '../../networkcalls/response_models/event_detail_entity.dart';

class EventTabs extends StatefulWidget {
  final String? eventId;
  final String? title;
  const EventTabs({
    Key? key,
    required this.eventId,
    required this.title,
  }) : super(key: key);
  @override
  EventTabsState createState() => EventTabsState();
}

class EventTabsState extends State<EventTabs> {
  late DBEvent _event;
  bool wait = false;
  bool dataFetched = false;
  String myCurrentDate = '';
  String myCurrentTime = '';

  @override
  void initState() {
    _event = DBEvent();
    setEventFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getEventDetails();
    });
    DateTime now = DateTime.now();
    print("current=${now}");
    // final DateTime now = DateTime.parse(apiDate);
    // DateTime now = DateTime.now();
    // String nowDate = now.toString();
    final DateFormat formatter = DateFormat("dd/MM/yyyy");
    myCurrentTime = DateFormat.jm().format(now);
    print("ourTime: $myCurrentTime");
    myCurrentDate = formatter.format(now);
    print("formattedDate: $myCurrentDate");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
        ),
        title: Text(
          _event.title ?? '',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(16),
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            tabWidget(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildScreen(),
                    EventAttendiesView(eventId: widget.eventId ?? '',),
                    EventCommentScreen(eventId: widget.eventId ?? '')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
      ),
      child: TabBar(
        indicatorColor: AppColor.primaryColor,
        labelStyle: TextStyle(
            fontSize: ScreenUtil().setSp(12), fontWeight: FontWeight.w700),
        labelColor: AppColor.black,
        unselectedLabelColor: AppColor.grey,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(
            text: 'EVENT DETAIL',
          ),
          Tab(text: 'ATTENDEES'),
          Tab(text: 'DISCUSSION'),
        ],
      ),
    );
  }

  Widget buildScreen() {
    return dataFetched
        ? _bodyContainer()
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _bodyContainer() {
    return Stack(
      children: [
        Container(
          color: AppColor.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      AppUtils().calculateEventDifference(_event.startDate ?? "") <
                          0
                          ? 'Event Started on ${_event.startDate ?? ''} ${_event.startTime ?? ''}'
                          : "Event will start on ${_event.startDate ?? ''} ${_event.startTime ?? ''}",
                      style: boldTextStyle(),
                    ),
                  ),
                ),
                const Divider(
                  color: AppColor.grey,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: AppColor.primaryColor,
                            size: 15.0.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(_event.startTime == null ? '${_event.startDate ?? ''} ${_event.startTime ?? ''}' : '${_event.startDate} at ${_event.startTime}',
                              style: WidgetStyle.semiBoldText(
                                  color: AppColor.greyshade600,
                                  fontSize: ScreenUtil().setSp(12))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(_event.endTime == null ? '${_event.endDate ?? ''}  ${_event.endTime ?? ''}' : '${_event.endDate} at ${_event.endTime}',
                              style: WidgetStyle.semiBoldText(
                                  color: AppColor.greyshade600,
                                  fontSize: ScreenUtil().setSp(12)))
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(
                            Icons.room_outlined,
                            color: AppColor.primaryColor,
                            size: 15.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(_event.venue ?? '',
                              style: WidgetStyle.semiBoldText(
                                color: AppColor.greyshade600,
                                fontSize: ScreenUtil().setSp(12),
                              ))
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text('Entry Info: ',
                              style: WidgetStyle.semiBoldText(
                                color: AppColor.greyshade600,
                                fontSize: ScreenUtil().setSp(12),
                              )),
                          Text(
                            "Free",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.black,
                              fontSize: ScreenUtil().setSp(12),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: AppColor.black,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('Detail:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                        fontSize: ScreenUtil().setSp(14),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _event.description ?? '',
                    style: TextStyle(
                      color: AppColor.black45,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: AppColor.black,
                  thickness: 1,
                ),
                CachedNetworkImage(
                  height: 200.h,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl: _event.image ?? '',
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage(
                      AppImages.noImage,
                    ),
                  ),
                ),
                _feedback(),
                const Divider(
                  color: AppColor.grey,
                ),
                _feedbackNumbers(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        Center(child: wait == true ? CircularProgressIndicator() : Container(),),
      ],
    );
  }

  _feedback() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w).copyWith(top: 8.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //likes
            GestureDetector(
              onTap: () {
                changeLike();
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _event.isLike == "0"
                        ? Image.asset(
                            AppImages.like,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            AppImages.likefill,
                            height: 24,
                            width: 24,
                          ),
                    const SizedBox(height: 4),
                    Text(
                      'Like',
                      style: TextStyle(
                        // fontFamily: 'Nunito',
                        fontSize: ScreenUtil().setSp(12),
                        color: _event.isLike == "0"
                            ? AppColor.black26
                            : AppColor.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //interested
            GestureDetector(
              onTap: () {
                changeStatus(_event.isInterested == "1" ? 'none' : "interested");
                print("EventInterested: ${changeStatus(_event.isInterested.toString())}");
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _event.isInterested == '0'
                        ? Image.asset(
                            AppImages.interest,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            AppImages.interestfill,
                            height: 24,
                            width: 24,
                          ),
                    const SizedBox(height: 4),
                    Text(
                      Strings.interested,
                      style: TextStyle(
                          // fontFamily: 'Nunito',
                          fontSize: ScreenUtil().setSp(12),
                          color: AppColor.greyshade600),
                    )
                  ],
                ),
              ),
            ),
            //going
            GestureDetector(
              onTap: () {
                changeStatus(_event.isGoing == "0" ? 'going' : "none");
                print("EventGoing: ${_event.isGoing}");
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _event.isGoing == '1'
                    ? Image.asset(
                      AppImages.goingfill,
                      height: 24,
                      width: 24,
                    )
                    : Image.asset(
                      AppImages.going,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Strings.going,
                      style: TextStyle(
                        // fontFamily: 'Nunito',
                        fontSize: ScreenUtil().setSp(12),
                          color: AppColor.greyshade600
                      ),
                    )
                  ],
                ),
              ),
            ),
            //share
            // GestureDetector(
            //   onTap: () {
            //     if (AppConstants.appName == "BOSS") {
            //       Share.share(
            //           "Admin created an event at BOSS Alumini\nTitle: ${_event.title}\nDescription: ${_event.description}\nStart At: ${_event.startTime}${_event.startDate}");
            //     } else if (AppConstants.appName == "DOW") {
            //       Share.share(
            //           "Admin created an event at DOW Alumini\nTitle: ${_event.title}\nDescription: ${_event.description}\nStart At: ${_event.startTime}${_event.startDate}");
            //     } else if (AppConstants.appName == "IOBM") {
            //       Share.share(
            //           "Admin created an event at IOBM Alumini\nTitle: ${_event.title}\nDescription: ${_event.description}\nStart At: ${_event.startTime}${_event.startDate}");
            //     }
            //   },
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Icon(
            //         Icons.share,
            //         color: AppColor.greyshade600,
            //       ),
            //       const SizedBox(
            //         height: 1,
            //       ),
            //       Text(Strings.share,
            //           style: WidgetStyle.semiBoldText(
            //               color: AppColor.greyshade600,
            //               fontSize: ScreenUtil().setSp(12)))
            //     ],
            //   ),
            // ),
          ]),
    );
  }

  Widget _feedbackNumbers() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //likes
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.likes,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45),
                ),
                Text(
                  _event.totalLike ?? '',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45),
                )
              ]),
          //interested
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.interested,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45),
                ),
                Text(
                  _event.totalInterested ?? '',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: AppColor.black45,
                  ),
                )
              ]),
          //going
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.going,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: AppColor.black45),
                ),
                Text(
                  _event.totalGoing ?? '',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: AppColor.black45,
                  ),
                )
              ]),
        ],
      ),
    );
  }

  Future<void> changeLike() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.eventLikeUnlike(
      userId: AppConstants.myId,
      eventId: widget.eventId,
      status: _event.isLike == "1" ? "unlike" : "like",
    );
    print("wait= $wait");
    if (response is ErrorEntity) {
    } else {
      EventLikeEntity likeEntity = EventLikeEntity().fromJson(response);

      if (likeEntity.success == 1) {
        await database.editLikeStatus(widget.eventId ?? '', _event.isLike == "1" ? "0" : "1",);
        await database.editTotalLikes(widget.eventId ?? '', likeEntity.result?.likes.toString() ?? '',);
        await setEventFromDB();
      }
    }
    setState(() {
      wait = false;
    });
  }


  Future<void> changeStatus(status) async {
    String myTime = myCurrentDate + myCurrentTime;
    String eventTime = _event.startDate! +" " + _event.startTime!;
    print("myTime= ${myTime}");
    print("eventTime= ${eventTime}");
    if (AppUtils().calculateDifferenceInSec(eventTime)! > 0) {
      setState(() {
        wait = true;
      });
      var response = await ApiCalls.changeEventStatus(
        userId: AppConstants.myId,
        eventId: widget.eventId,
        status: status,
      );
      print("Status Response: ${response}");

      if (response is ErrorEntity) {
      }
      else {
        EventStatusEntity statusEntity = EventStatusEntity().fromJson(response);

        if (statusEntity.success == 1) {
          print("statusEntity.result.toString()= ${statusEntity.result.interested}");
          if (status == "none") {
            await database.editInterestedStatus(widget.eventId ?? '', "0",);
            await database.editGoingStatus(widget.eventId ?? '', "0",);
          } else {
            await database.editInterestedStatus(widget.eventId ?? '', _event.isGoing == "1" ? "1" : "0",);
            await database.editGoingStatus(widget.eventId ?? '', _event.isInterested == "1" ? "1" : "0",);
          }
          await database.editTotalGoing(widget.eventId ?? '', statusEntity.result.going,);
          await database.editTotalInterested(widget.eventId ?? '', statusEntity.result.interested,);
          getEventDetails();
        }
      }
      setState(() {
        wait = false;
      });
    }
    else {
      Fluttertoast.showToast(msg: 'Event already finished');
    }
  }

  String date(String apiDate) {
    final DateTime now = DateTime.parse(apiDate);
    final DateFormat formatter = DateFormat("dd/MMMM/yyyy");
    final String formatted = formatter.format(now);
    print("dateFormat: $formatted"); // something like 2013-04-20
    return formatted;
  }

  Future<void> setEventFromDB() async {
    print("widget.eventId= ${widget.eventId}");
    _event = await database.getSingleEvent(widget.eventId ?? '1');
    print("EventUpdate=${_event}");
    setState(() {
      dataFetched = true;
    });
  }

  // Future<void> getEventDetails() async {
  //   DataFetched dataFetched = await ApiHelper.getEventDetails(widget.eventId);
  //   if (dataFetched.done) {
  //     setEventFromDB();
  //   }
  // }

  Future<void> getEventDetails() async {
    print("enter1");
    var response = await ApiCalls.eventDetails(
      userId: AppConstants.myId,
      eventId: widget.eventId,
    );
    if (response is ErrorEntity) {
      print("enter2");
    } else {
      print("enter3");
      EventDetailEntity detailEntity = EventDetailEntity().fromJson(response);
      if (detailEntity.success == 1) {
        print("enter4");
        print("detailEntity= ${detailEntity.result!.first.isInterested}");
        database.deleteSingleEvent(widget.eventId??"1");
        for (var element in detailEntity.result!) {
          DBEvent dbEvent = DBEvent(
            id: element.id,
            description: element.description,
            startDate: element.startDate,
            startTime: element.startTime,
            isLike: element.isLike,
            isInterested: element.isInterested,
            totalComments: element.totalComments,
            title: element.title,
            isGoing: element.isGoing,
            image: element.image,
            totalLike: element.totalLike,
            totalGoing: element.totalGoing,
            endDate: element.endDate,
            endTime: element.endTime,
            totalInterested: element.totalInterested,
            city: element.city,
            venue: element.venue,
          );
          database.insertSingleEvent(dbEvent);
        }
        setEventFromDB();
        print("Added -----");
      }
    }
  }
}
