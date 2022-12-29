import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iobm/Views/buy_and_sell_tle/buy_sell_screen.dart';
import 'package:iobm/Views/news_feeds/alumni_feed.dart';
import 'package:iobm/Views/services/services_screen.dart';

import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:iobm/utils/strings.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 12.sp),
          unselectedLabelStyle: TextStyle(fontSize: 11.sp),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 22.h,
              ),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_rounded,
                size: 22.h,
              ),
              label: 'Alumni',
            ),
            AppConstants.appName == 'TLE'
                ? BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 22.h,
                    ),
                    label: Strings.buysell)
                : BottomNavigationBarItem(
                    icon: Icon(
                      Icons.date_range,
                      size: 22.h,
                    ),
                    label: Strings.events),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 22.h,
                ),
                label: Strings.chat),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  size: 22.h,
                ),
                label: Strings.more),
          ],
          unselectedItemColor: AppColor.greyshade600,
          selectedItemColor: AppColor.primaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onTabTapped(index);
          },
        ),
      ),
    );
  }
}
