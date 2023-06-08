
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:iobm/Views/buy_and_sell_tle/buy_sell_screen.dart';
import 'package:iobm/Views/news_feeds/alumni_feed.dart';
import 'package:iobm/Views/services/services_screen.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:iobm/utils/strings.dart';

import '../controllers/profile_controller.dart';
import '../utils/text_styles.dart';
import 'Chat/chat_screen.dart';
import 'Event/event_screen.dart';
import 'alumni_screen.dart';

import 'more/more_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key, this.userID}) : super(key: key);
  final String? userID;

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;

  List<Widget> _scValue() => [
        const AlumniFeed(),
        // const ServicesScreen(),
        AlumniScreen(
          userID: widget.userID,
          checkMentor: 0,
        ),
        AppConstants.appName == 'TLE'
            ? const BuySellScreen()
            : const EventScreen(),
        const ChatScreen(),
        const MoreScreen(),
      ];
  void _onTabTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          final result = await showDialog(
            context: context,
            builder: (builder) => AlertDialog(
              title: const Text(
                "Exit the App?",
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: const Text(Strings.nO),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    TextButton(
                      child: const Text(
                        Strings.yes,
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
          return result;
        }
        setState(() {
          _selectedIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: _scValue()[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _selectedIndex,
          height: kToolbarHeight,
          items: <Widget>[
            Container(
              margin: _selectedIndex==0 ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 12),
              height: 41.h,
              child: _selectedIndex==0 ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.home, size: 22.h, color: AppColor.white),
              ) : Column(
                children: [Icon(Icons.home, size: 22.h, color: AppColor.white), Text("Home", style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),)],
              ),
            ),
            Container(
              margin: _selectedIndex==1 ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 12),
              height: 41.h,
              child: _selectedIndex==1 ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.people_rounded, size: 22.h, color: AppColor.white),
              ) : Column(
                children: [Icon(Icons.people_rounded, size: 22.h, color: AppColor.white), Text("Alumni", style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),)],
              ),
            ),
            Container(
              margin: _selectedIndex==2 ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 12),
              height: 41.h,
              child: _selectedIndex==2 ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.date_range, size: 22.h, color: AppColor.white),
              ) : Column(
                children: [Icon(Icons.date_range, size: 22.h, color: AppColor.white), Text("Events", style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),)],
              ),
            ),
            Container(
              margin: _selectedIndex==3 ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 12),
              height: 41.h,
              child: _selectedIndex==3 ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.chat, size: 22.h, color: AppColor.white),
              ) : Column(
                children: [
                  GetBuilder<ProfileController>(builder: (controller){
                    return Badge(
                      isLabelVisible: controller.firebaseNotificationCount == 0 ? false : true,
                      label: Text(controller.firebaseNotificationCount.toString()),
                      child: Icon(Icons.chat, size: 22.h, color: AppColor.white),
                    );
                  }),
                  Text("Chat", style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.iconColor),)
                ],
              ),
            ),
            Container(
              margin: _selectedIndex==4 ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: 12),
              height: 41.h,
              child: _selectedIndex==4 ? Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(Icons.menu, size: 22.h, color: AppColor.white),
              ) : Column(
                children: [Icon(Icons.menu, size: 22.h, color: AppColor.white), Text("More", style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.white),)],
              ),
            ),
          ],
          color: AppColor.primaryColor,
          buttonBackgroundColor: AppColor.primaryColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _onTabTapped(index);
            });
          },
          letIndexChange: (index) => true,
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   selectedLabelStyle: TextStyle(fontSize: 12.sp),
        //   unselectedLabelStyle: TextStyle(fontSize: 11.sp),
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         size: 22.h,
        //       ),
        //       label: Strings.home,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.people_rounded,
        //         size: 22.h,
        //       ),
        //       label: 'Alumni',
        //     ),
        //     AppConstants.appName == 'TLE'
        //         ? BottomNavigationBarItem(
        //             icon: Icon(
        //               Icons.shopping_cart_outlined,
        //               size: 22.h,
        //             ),
        //             label: Strings.buysell)
        //         : BottomNavigationBarItem(
        //             icon: Icon(
        //               Icons.date_range,
        //               size: 22.h,
        //             ),
        //             label: Strings.events),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.chat,
        //           size: 22.h,
        //         ),
        //         label: Strings.chat),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.menu,
        //           size: 22.h,
        //         ),
        //         label: Strings.more),
        //   ],
        //   unselectedItemColor: AppColor.greyshade600,
        //   selectedItemColor: AppColor.primaryColor,
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: _selectedIndex,
        //   onTap: (index) {
        //     _onTabTapped(index);
        //   },
        // ),
      ),
    );
  }
}
