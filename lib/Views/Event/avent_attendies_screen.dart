import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

import '../more/profile_screen.dart';

class EventAttendiesView extends StatefulWidget {
  final String eventId;
  const EventAttendiesView({Key? key, required this.eventId}) : super(key: key);

  @override
  _EventAttendiesViewState createState() => _EventAttendiesViewState();
}

class _EventAttendiesViewState extends State<EventAttendiesView> {
  late List<DBAttendie> _attendies;
  bool dataFetched = false;

  @override
  void initState() {
    _attendies = [];
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getAttendies();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Value= $dataFetched");
    return dataFetched
        ? _attendees()
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _attendees() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: _attendies.length,
          itemBuilder: (BuildContext context, int index) {
            return _attendies[index].status != "none" ?
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ProfileScreen(userID: _attendies[index].userId);
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    border: Border(
                      top: BorderSide(color: AppColor.black12, width: 0.4),
                      bottom: BorderSide(color: AppColor.black12, width: 0.4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //go to profile
                      CircleAvatar(
                        //profile image
                        backgroundImage: const AssetImage(AppImages.profile),
                        radius: 22.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_attendies[index].firstName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Class of ${_attendies[index].graduationYear}',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: AppColor.grey))
                        ],
                      )),
                      Text(_attendies[index].status!.toUpperCase(),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: AppColor.grey),
                      )
                    ],
                  ),
                ),
              ),
            )
                :
            Container();

            // return Column(
            //   children: [
            //     CustomWidget.attendenceUser(
            //       name: _attendies[index].firstName,
            //       image: "assets/images/profile.png",
            //       year: "1975",
            //     ),
            //     const Divider(
            //       thickness: 1,
            //     ),
            //   ],
            // );
          }),
    );
  }

  Future<void> setDataFromDB() async {
    print("setData=${_attendies}");
    _attendies = await database.getAttendies();
    setState(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        dataFetched = true;
      });
    });
  }

  Future<void> getAttendies() async {
    setDataFromDB();
    DataFetched _dataFetched = await ApiHelper.loadAttendies(context, widget.eventId);
    if (_dataFetched.done) {
      setDataFromDB();
    }else {
      setState(() {
        //clearListOfAttendees
        _attendies.clear();
      });
    }
  }
}
