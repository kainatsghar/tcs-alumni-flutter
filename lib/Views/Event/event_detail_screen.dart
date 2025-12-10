import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';
// import 'package:share/share.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/app_images.dart';

class EventDetails extends StatefulWidget {
  final String? id;
  const EventDetails({Key? key, this.id}) : super(key: key);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late DBEvent _event;
  bool wait = false;
  bool dataFetched = false;

  @override
  void initState() {
    setEventFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getEventDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return dataFetched
        ? _bodyContainer()
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _bodyContainer() {
    return Container(
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
                  'Event Started on ${_event.startDate} ${_event.startTime}',
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
                        size: 20.0.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text('${_event.startDate} at ${_event.startTime}',
                          style: WidgetStyle.semiBoldText(
                              color: AppColor.greyshade600,
                              fontSize: ScreenUtil().setSp(13))),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text('${_event.endDate} at ${_event.endTime}',
                          style: WidgetStyle.semiBoldText(
                              color: AppColor.greyshade600, fontSize: 13.0.sp))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.room_outlined,
                          color: AppColor.primaryColor, size: 22.w),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(_event.venue ?? '',
                          style: WidgetStyle.semiBoldText(
                              color: AppColor.greyshade600, fontSize: 13.0.sp))
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text('Entry Info: ',
                          style: WidgetStyle.semiBoldText(
                              color: AppColor.greyshade600, fontSize: 13.0.sp)),
                      Text(
                        "Free",
                      ),
                      // Text(widget.event!.paymentOpen ?? '',
                      //     style: WidgetStyle.underBoldLineTextStyle(
                      //       color: AppColor.greyshade600,
                      //       fontSize: 13.0.sp,
                      //       fontWeight: FontWeight.w900,
                      //     ))
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
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: _event.image ?? '',
              errorWidget: (context, url, error) => const Image(
                image: AssetImage(
                  AppImages.noImage,
                ),
              ),
            ),
            // Image.asset(
            //   img,
            // ),

            _feedback(),
            const Divider(
              color: AppColor.grey,
            ),
            _feedbackNumbers()
          ],
        ),
      ),
    );
  }

  _feedback() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                changeLike();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _event.isLike == "0"
                      ? Icon(
                          Icons.favorite_border,
                          color: _event.isLike == "0"
                              ? AppColor.black26
                              : AppColor.primaryColor,
                        )
                      : Icon(
                          Icons.favorite_outline,
                          color: _event.isLike == "0"
                              ? AppColor.black26
                              : AppColor.primaryColor,
                        ),
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
            GestureDetector(
              onTap: () {
                changeStatus(
                    _event.isInterested == "1" ? 'none' : "interested");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _event.isInterested == '0'
                      ? Icon(
                          Icons.star_border,
                          color: _event.isInterested == '0'
                              ? AppColor.greyshade600
                              : AppColor.primaryColor,
                        )
                      : Icon(
                          Icons.star_rounded,
                          color: _event.isInterested == '0'
                              ? AppColor.greyshade600
                              : AppColor.primaryColor,
                        ),
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
            GestureDetector(
              onTap: () {
                changeStatus(_event.isGoing == "0" ? 'going' : "none");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image(
                  //   image: AssetImage('icons/drawable-mdpi/Group 6507.png'),
                  //   filterQuality: FilterQuality.none,
                  // ),
                  Icon(
                    Icons.done,
                    color: _event.isGoing == '1'
                        ? AppColor.primaryColor
                        : AppColor.black26,
                  ),
                  Text(
                    Strings.going,
                    style: TextStyle(
                      // fontFamily: 'Nunito',
                      fontSize: ScreenUtil().setSp(12),
                      color: _event.isGoing == '1'
                          ? AppColor.primaryColor
                          : AppColor.black26,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   Share.share(
              //       "Admin created an event at DOW Alumini\n"
              //           "Title: ${_event.title}\n"
              //           "Description: ${_event.description}\n"
              //           "Start At: ${_event.startTime}${_event.startDate}"
              //   );
              // },
              onTap: () {
                if (Platform.isAndroid) {
                  Share.share(
                      "Admin created an event at DOW Alumini\nTitle: ${_event.title}\nDescription: ${_event.description}\nStart At: ${_event.startTime}${_event.startDate}");
                } else if (Platform.isIOS) {
                  Share.share(
                      "Admin created an event at DOW Alumini\nTitle: ${_event.title}\nDescription: ${_event.description}\nStart At: ${_event.startTime}${_event.startDate}");
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.share,
                    color: AppColor.greyshade600,
                  ),
                  Text(Strings.share,
                      style: WidgetStyle.semiBoldText(
                          color: AppColor.greyshade600,
                          fontSize: ScreenUtil().setSp(12)))
                ],
              ),
            ),
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
        ));
  }

  Future<void> changeLike() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.eventLikeUnlike(
      userId: AppConstants.myId,
      eventId: widget.id,
      status: _event.isLike == "1" ? "unlike" : "like",
    );
    if (response is ErrorEntity) {
    } else {
      EventLikeEntity likeEntity = EventLikeEntity().fromJson(response);

      if (likeEntity.success == 1) {
        await database.editLikeStatus(
          widget.id ?? '',
          _event.isLike == "1" ? "0" : "1",
        );

        await database.editTotalLikes(
          widget.id ?? '',
          likeEntity.result!.likes.toString(),
        );
        await setEventFromDB();
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> changeStatus(status) async {
    if (AppUtils().calculateDifferenceInSec(_event.startDate ?? "")! > 0) {
      setState(() {
        wait = true;
      });
      var response = await ApiCalls.changeEventStatus(
        userId: AppConstants.myId,
        eventId: widget.id,
        status: status,
      );
      if (response is ErrorEntity) {
      } else {
        EventStatusEntity statusEntity = EventStatusEntity().fromJson(response);

        if (statusEntity.success == 1) {
          if (status == "none") {
            await database.editInterestedStatus(
              widget.id ?? '',
              "0",
            );
            await database.editGoingStatus(
              widget.id ?? '',
              "0",
            );
          } else {
            await database.editInterestedStatus(
              widget.id ?? '',
              _event.isGoing == "1" ? "1" : "0",
            );
            await database.editGoingStatus(
              widget.id ?? '',
              _event.isInterested == "1" ? "1" : "0",
            );
          }

          await database.editTotalGoing(
            widget.id ?? '',
            statusEntity.result.going,
          );

          await database.editTotalInterested(
            widget.id ?? '',
            statusEntity.result.interested,
          );
          await setEventFromDB();
        }
      }
      setState(() {
        wait = false;
      });
    } else {
      Fluttertoast.showToast(msg: 'Event already finished');
    }
  }

  Future<void> setEventFromDB() async {
    _event = await database.getSingleEvent(widget.id ?? '1');
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getEventDetails() async {
    DataFetched dataFetched = await ApiHelper.getEventDetails(widget.id);
    if (dataFetched.done) {
      setEventFromDB();
    }
  }
}
