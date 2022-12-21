import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/Chat/send_invation_screen.dart';
import 'package:iobm/Views/Event/event_tabs.dart';
import 'package:iobm/Views/bottom_navigationbar.dart';

import 'package:iobm/Views/more/career/opening_job_screen.dart';
import 'package:iobm/Views/more/discount/avail_discount_screen.dart';
import 'package:iobm/Views/more/profile_screen.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/strings.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  late Future _fetchData;
  late List<DBNotification> _notifications;

  @override
  void initState() {
    _notifications = [];
    _fetchData = getNotifications();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_notifications);
      },
      child: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(color: AppColor.secAppBar, width: 3.w),
          ),
          title: Text(
            Strings.notifications,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              // fontWeight: FontWeight.bold,
            ),
          ),
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
      ),
    );
  }

  Widget _bodyColumn() {
    return _notificationBuilder();
  }

  _notificationBuilder() {
    return ListView.builder(
        itemCount: _notifications.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (_notifications[index].type!.containsIgnoreCase("Job")) {
                Get.to(() => const JobOpening());
              } else if (_notifications[index]
                  .type!
                  .containsIgnoreCase("user")) {
                Get.to(
                  () => ProfileScreen(
                    userID: _notifications[index].from,
                  ),
                );
              } else if (_notifications[index]
                  .type!
                  .containsIgnoreCase("Event")) {
                Get.to(
                  () => EventTabs(
                      title: '', eventId: _notifications[index].eventId),
                );
              } else if (_notifications[index]
                  .type!
                  .containsIgnoreCase("Discount_offer")) {
                Get.to(
                  () => const AvailDiscount(),
                );
              } else if (_notifications[index]
                  .type!
                  .containsIgnoreCase("newsfeed")) {
                Get.to(
                  () => const BottomNavigationScreen(),
                );
              } else if (_notifications[index]
                  .type!
                  .containsIgnoreCase("chat")) {
                Get.to(
                  () => ChatInvitationScreen(
                    image: '',
                    name: '',
                    receiverId: _notifications[index].userId,
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.black12,
                    ),
                  ],
                  border: Border(
                    left: BorderSide(
                      color: _notifications[index].readStatus == "N"
                          ? AppColor.primaryColor
                          : AppColor.greyshade400,
                      width: 4,
                    ),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_notifications[index].title}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.bold,
                        color: AppColor.black54,
                      ),
                    ),
                    Text(
                      "${_notifications[index].description}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: AppColor.black38,
                      ),
                    ),
                    Text(
                      "${_notifications[index].date}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: AppColor.black38,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> setDataFromDB() async {
    _notifications = await database.getNotifications();
  }

  Future<void> getNotifications() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.getUserNotifications();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}

extension StringExtensions on String {
  bool containsIgnoreCase(String secondString) =>
      toLowerCase().contains(secondString.toLowerCase());
}
