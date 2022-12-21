import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/workorder/post_work_order.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../local_db/local_db.dart';
import '../../../models/data_fetched.dart';
import '../../../networkcalls/api_helper.dart';

class WorkOrders extends StatefulWidget {
  const WorkOrders({Key? key}) : super(key: key);

  @override
  _WorkOrdersState createState() => _WorkOrdersState();
}

class _WorkOrdersState extends State<WorkOrders> {

  late Future fetchData;
  late List<DBWorkOrder> _workList;
  late List<DBWorkOrder> _myWorkList;

  Future<void>? _launched;

  @override
  void initState() {
    _workList = [];
    _myWorkList = [];
    fetchData = getWorkCall();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SecAppBar(
          title: const Text('Work Order'),
          context: context,
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColor.grey))),
              child: TabBar(
                indicatorColor: AppColor.redshade900,
                labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
                labelColor: AppColor.black,
                unselectedLabelColor: AppColor.grey,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: 'Work Orders',
                  ),
                  Tab(text: 'My Work Orders'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FutureBuilder(
                    future: fetchData,
                      builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return _workorders();
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                        }
                  }),
                  FutureBuilder(
                      future: fetchData,
                      builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return _myworkorders();
                    }
                    else{
                      return const Center(child:  CircularProgressIndicator(),);
                    }
                  }),
                ],
              ),
            ),
          ]),
        ));
  }

  _workorders() {
    return Container(
        color: AppColor.white,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _workcontainer(),
            // SizedBox(
            //   height: 10.h,
            // ),
            // _workcontainer()
          ],
        ));
  }

  _myworkorders() {
    return Container(
        color: AppColor.white,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _myworkcontainer(),
            SizedBox(
              height: 10.h,
            ),
            // _myworkcontainer()
          ],
        ));
  }

  _workcontainer() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _workList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                  BoxShadow(
                    color: AppColor.greyshade200,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ], borderRadius: BorderRadius.circular(8.r), color: AppColor.white),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_workList[index].designation??'',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold)),
                        _workList[index].document!.isNotEmpty ? CustomWidget.myButton(
                            isBorder: false,
                            size: Size(45.w, 20.h),
                            name: 'View Document',
                            onClicked: () {
                              _launched = _launchInBrowser(_workList[index].document??'');
                            }): const Spacer(),
                      ],
                    ),
                    Text('${_workList[index].companyName}',
                        style: TextStyle(
                          // //Family: 'Nunito',
                            fontSize: 11.sp)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                        '${_workList[index].description}',
                        style: TextStyle(
                          // //Family: 'Nunito',
                            fontSize: 11.sp,
                            color: AppColor.greyshade700)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Due Date: ',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.black)),
                              TextSpan(
                                  text: '${_workList[index].duaDate}',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.redshade900))
                            ])),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Posted By: ',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.black)),
                              TextSpan(
                                  text: _workList[index].firstName,
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.redshade900))
                            ])),
                      ],
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }

  _myworkcontainer() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: _myWorkList.length,
        itemBuilder: (context, index)=> Column(
          children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColor.greyshade200,
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ], borderRadius: BorderRadius.circular(8.r), color: AppColor.white),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text( _myWorkList[index].designation??'',
                              style: TextStyle(
                                // //Family: 'Nunito',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        _myWorkList[index].document!.isNotEmpty ? CustomWidget.myButton(
                            isBorder: false,
                            size: Size(45.w, 20.h),
                            name: 'View Document',
                            onClicked: () {
                              _launched = _launchInBrowser(_myWorkList[index].document??'');
                            }): const Spacer(),
                        IconButton(
                          onPressed: (){
                            Get.to(() => PostWorkOrder(
                              designation: _myWorkList[index].designation,
                              company: _myWorkList[index].companyName,
                              description: _myWorkList[index].description,
                              dueDate: _myWorkList[index].duaDate,
                              workId: _myWorkList[index].id,
                              doc : _myWorkList[index].document.toString(),
                            ));

                            // delWorkCall(_myWorkList[index].id);
                          },
                          icon: Icon(Icons.edit, color: AppColor.redshade900),
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                        )
                      ],
                    ),
                    Text(_myWorkList[index].companyName??'',
                        style: TextStyle(
                          // //Family: 'Nunito',
                            fontSize: 11.sp)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                        _myWorkList[index].description??'',
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColor.greyshade700)),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Due Date: ',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.black)),
                              TextSpan(
                                  text: _myWorkList[index].duaDate??'',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.redshade900))
                            ])),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Posted By: ',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.black)),
                              TextSpan(
                                  text: _myWorkList[index].firstName??'N/A',
                                  style: TextStyle(
                                    // //Family: 'Nunito',
                                      fontSize: 12.sp,
                                      color: AppColor.redshade900)),
                            ])),
                      ],
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }






  Future<void> setDataFromDB() async {
    _workList = await database.getWorkOrders();
    _myWorkList = await database.getMyWorkOrders(AppConstants.myId);
    print(AppConstants.myId);
  }


    Future<void> getWorkCall() async {
      setDataFromDB();

      DataFetched dataFetched = await ApiHelper.getWorkOrder();

      if (dataFetched.done) {
       await setDataFromDB();
        print('done bro');
      }
    }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }







}
