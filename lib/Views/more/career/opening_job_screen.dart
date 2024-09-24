import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/more/career/post_job_screen.dart';
import 'package:iobm/Widgets/custom_widgets.dart';

import 'package:iobm/local_db/local_db.dart';

import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';

import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_images.dart';
import '../../../utils/text_styles.dart';
import '../../Chat/full_img_view.dart';

class JobOpening extends StatefulWidget {
  const JobOpening({Key? key}) : super(key: key);

  @override
  JobOpeningState createState() => JobOpeningState();
}

class JobOpeningState extends State<JobOpening> {
  late List<DBJob> _jobsList;
  late List<DBJob> _myJobs;
  late Future _fetchData;
  Future<void>? _launched;
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

  @override
  void initState() {
    _jobsList = [];
    _myJobs = [];
    _fetchData = getJobs();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        titleTextStyle: CustomTextStyles.text16SemiBoldW600,
        shape: Border(
          bottom: BorderSide(color: AppColor.secAppBar, width: 4.w),
        ),
        title: Text(
          Strings.jobs,
          style: CustomTextStyles.text16SemiBoldW600,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 22.h,
            color: AppColor.white,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: _bodyColumn(),
      ),
    );
  }

  Widget _bodyColumn() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            // border: Border(
            //   top: BorderSide(color: AppColor.black26, width: 2),
            // ),
          ),
          height: 40.h,
          child: TabBar(
            indicatorColor: AppColor.primaryColor,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.grey,
            tabs: [
              Text(
                Strings.jobopening,
                style: CustomTextStyles.text14SemiBoldW600,
              ),
              Text(
                Strings.myjobs,
                style: CustomTextStyles.text14SemiBoldW600,
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              FutureBuilder(
                future: _fetchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _jobOpenings();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: _fetchData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _myJob();
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _jobOpenings() {
    print("JobImage=${_jobsList[0].jobImage}");
    return ListView.builder(
      itemCount: _jobsList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 16.w),
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                    color: AppColor.black26,
                  ))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _jobsList[index].jobImage != ''  ? GestureDetector(
                      onTap: (){
                        Get.to(() =>  FullFileView(
                            image: _jobsList[index].jobImage.toString() ?? '',
                            type: 'jobImage'));
                      },
                      child: Container(
                        height: 108.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.r),
                          image:  DecorationImage(image: NetworkImage(_jobsList[index].jobImage.toString() ?? ''),fit: BoxFit.cover)
                        ),
                      ),
                    ) :
                    GestureDetector(
                      onTap: (){
                        Get.to(() => const FullFileView(
                            image: '',
                            type: 'jobImage'));
                      },
                      child: Container(
                        height: 108.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.r),
                            image:  DecorationImage(image: AssetImage(
                              AppImages.noImage,
                            ),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                _jobsList[index].designation ?? '',
                                style: CustomTextStyles.text14SemiBoldW600,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 5.w,),
                              _jobsList[index].postedBy == AppConstants.myId
                                  ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return PostJobScreen(
                                          dueDate: _jobsList[index].duaDate,
                                          designation:
                                          _jobsList[index].designation,
                                          jobLink: _jobsList[index].joblink,
                                          company:
                                          _jobsList[index].companyName,
                                          jobID: _jobsList[index].id,
                                        );
                                      },
                                    ),
                                  ).then((value) => getJobs());
                                  // Get.to(
                                  //   () => PostJobScreen(
                                  //     dueDate: _jobsList[index].duaDate,
                                  //     designation:
                                  //         _jobsList[index].designation,
                                  //     jobLink: _jobsList[index].joblink,
                                  //     company: _jobsList[index].companyName,
                                  //     jobID: _jobsList[index].id,
                                  //   ),
                                  // )!
                                  //     .then((value) => getJobs());
                                },
                                child:  ImageIcon(AssetImage('assets/icons/edit_under.png'),size: 15,color: AppColor.blue,),
                              )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            _jobsList[index].companyName ?? '',
                            style: CustomTextStyles.text12RegularW400,
                          ),
                          Row(
                            children: [
                              Text(
                                'Published By: ',
                                style: CustomTextStyles.text12RegularW400,
                              ),
                              Text(
                                _jobsList[index].firstName ?? '',
                                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Due Date: ',
                                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
                              ),
                              Text(
                                _jobsList[index].duaDate ?? '',
                                style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h,),
                          Column(
                            children: [
                              _jobsList[index].joblink != null  ? GestureDetector(
                                onTap: () {},
                                child: CustomWidget.linkBtn(
                                  title: AppConstants.link,
                                  onclick: () {
                                    setState(
                                          () {
                                        _launched = _launchInBrowser(
                                            _jobsList[index].joblink ?? '');
                                      },
                                    );
                                  },
                                ),
                              ) : SizedBox(),
                              _jobsList[index].postedBy == AppConstants.myId
                                  ? const SizedBox(
                                width: 5,
                              )
                                  : const SizedBox(),
                              // _jobsList[index].postedBy == AppConstants.myId
                              //     ? GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (BuildContext context) {
                              //           return PostJobScreen(
                              //             dueDate: _jobsList[index].duaDate,
                              //             designation:
                              //             _jobsList[index].designation,
                              //             jobLink: _jobsList[index].joblink,
                              //             company:
                              //             _jobsList[index].companyName,
                              //             jobID: _jobsList[index].id,
                              //           );
                              //         },
                              //       ),
                              //     ).then((value) => getJobs());
                              //     // Get.to(
                              //     //   () => PostJobScreen(
                              //     //     dueDate: _jobsList[index].duaDate,
                              //     //     designation:
                              //     //         _jobsList[index].designation,
                              //     //     jobLink: _jobsList[index].joblink,
                              //     //     company: _jobsList[index].companyName,
                              //     //     jobID: _jobsList[index].id,
                              //     //   ),
                              //     // )!
                              //     //     .then((value) => getJobs());
                              //   },
                              //   child: const Icon(
                              //     Icons.edit,
                              //     color: AppColor.primaryColor,
                              //   ),
                              // )
                              //     : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {},
                    //       child: CustomWidget.linkBtn(
                    //         title: AppConstants.link,
                    //         onclick: () {
                    //           setState(
                    //             () {
                    //               _launched = _launchInBrowser(
                    //                   _jobsList[index].joblink ?? '');
                    //             },
                    //           );
                    //         },
                    //       ),
                    //     ),
                    //     _jobsList[index].postedBy == AppConstants.myId
                    //         ? const SizedBox(
                    //             width: 5,
                    //           )
                    //         : const SizedBox(),
                    //     _jobsList[index].postedBy == AppConstants.myId
                    //         ? GestureDetector(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (BuildContext context) {
                    //                     return PostJobScreen(
                    //                       dueDate: _jobsList[index].duaDate,
                    //                       designation:
                    //                           _jobsList[index].designation,
                    //                       jobLink: _jobsList[index].joblink,
                    //                       company:
                    //                           _jobsList[index].companyName,
                    //                       jobID: _jobsList[index].id,
                    //                     );
                    //                   },
                    //                 ),
                    //               ).then((value) => getJobs());
                    //               // Get.to(
                    //               //   () => PostJobScreen(
                    //               //     dueDate: _jobsList[index].duaDate,
                    //               //     designation:
                    //               //         _jobsList[index].designation,
                    //               //     jobLink: _jobsList[index].joblink,
                    //               //     company: _jobsList[index].companyName,
                    //               //     jobID: _jobsList[index].id,
                    //               //   ),
                    //               // )!
                    //               //     .then((value) => getJobs());
                    //             },
                    //             child: const Icon(
                    //               Icons.edit,
                    //               color: AppColor.primaryColor,
                    //             ),
                    //           )
                    //         : Container(),
                    //   ],
                    // ),
                  ],
                ),
                // const SizedBox(
                //   height: 3,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Text(
                //           'Due Date: ',
                //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
                //         ),
                //         Text(
                //           _jobsList[index].duaDate ?? '',
                //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Text(
                //           'Published By: ',
                //           style: CustomTextStyles.text12RegularW400,
                //         ),
                //         Text(
                //           _jobsList[index].firstName ?? '',
                //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _myJob() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: _myJobs.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 16.w),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColor.black26,
                ),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _myJobs[index].jobImage != ''  ? GestureDetector(
                        onTap: (){
                          Get.to(() =>  FullFileView(
                              image: _myJobs[index].jobImage.toString() ?? '',
                              type: 'jobImage'));
                        },
                        child: Container(
                          height: 108.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.r),
                              image:  DecorationImage(image: NetworkImage(_myJobs[index].jobImage.toString() ?? ''),fit: BoxFit.cover)
                          ),
                        ),
                      ) :
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const FullFileView(
                              image: '',
                              type: 'jobImage'));
                        },
                        child: Container(
                          height: 108.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.r),
                              image:  DecorationImage(image: AssetImage(
                                AppImages.noImage,
                              ),fit: BoxFit.cover)
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _myJobs[index].designation ?? '',
                                          style: CustomTextStyles.text14SemiBoldW600,
                                        ),
                                        SizedBox(width: 5.w,),
                                        _myJobs[index].postedBy == AppConstants.myId
                                            ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return PostJobScreen(
                                                    dueDate: _myJobs[index].duaDate,
                                                    designation:
                                                    _myJobs[index].designation,
                                                    jobLink: _myJobs[index].joblink,
                                                    company: _myJobs[index].companyName,
                                                    jobID: _myJobs[index].id,
                                                  );
                                                },
                                              ),
                                            ).then((value) => getJobs());
                                            // Get.to(
                                            //   () => PostJobScreen(
                                            //     dueDate: _myJobs[index].duaDate,
                                            //     designation: _myJobs[index].designation,
                                            //     jobLink: _myJobs[index].joblink,
                                            //     company: _myJobs[index].companyName,
                                            //     jobID: _myJobs[index].id,
                                            //   ),
                                            // )!
                                            //     .then((value) => getJobs());
                                          },
                                          child: ImageIcon(AssetImage('assets/icons/edit_under.png'),size: 15,color: AppColor.blue,),
                                        )
                                            : Container(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      _myJobs[index].companyName ?? '',
                                      style: CustomTextStyles.text12RegularW400,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Published By: ',
                                          style: CustomTextStyles.text12RegularW400,
                                        ),
                                        Text(
                                          _myJobs[index].firstName ?? '',
                                          style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Due Date: ',
                                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
                                    ),
                                    Text(
                                      _myJobs[index].duaDate ?? '',
                                      style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 7.h,),
                            Row(
                              children: [
                                CustomWidget.linkBtn(title: AppConstants.link),
                                _myJobs[index].postedBy == AppConstants.myId
                                    ? const SizedBox(
                                  width: 5,
                                )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget _bodyColumn() {
  //   return Column(
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(
  //             // border: Border(
  //             //   top: BorderSide(color: AppColor.black26, width: 2),
  //             // ),
  //             ),
  //         height: 40.h,
  //         child: TabBar(
  //           indicatorColor: AppColor.primaryColor,
  //           labelColor: AppColor.primaryColor,
  //           unselectedLabelColor: AppColor.grey,
  //           tabs: [
  //             Text(
  //               Strings.jobopening,
  //               style: CustomTextStyles.text14SemiBoldW600,
  //             ),
  //             Text(
  //               Strings.myjobs,
  //               style: CustomTextStyles.text14SemiBoldW600,
  //             ),
  //           ],
  //         ),
  //       ),
  //       Expanded(
  //         child: TabBarView(
  //           children: [
  //             FutureBuilder(
  //               future: _fetchData,
  //               builder: (context, snapshot) {
  //                 if (snapshot.connectionState == ConnectionState.done) {
  //                   return _jobOpenings();
  //                 } else {
  //                   return const Center(
  //                     child: CircularProgressIndicator(),
  //                   );
  //                 }
  //               },
  //             ),
  //             FutureBuilder(
  //               future: _fetchData,
  //               builder: (context, snapshot) {
  //                 if (snapshot.connectionState == ConnectionState.done) {
  //                   return _myJob();
  //                 } else {
  //                   return const Center(
  //                     child: CircularProgressIndicator(),
  //                   );
  //                 }
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _jobOpenings() {
  //   return ListView.builder(
  //     itemCount: _jobsList.length,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         padding: EdgeInsets.only(left: 16.w),
  //         decoration: const BoxDecoration(
  //             border: Border(
  //                 top: BorderSide(
  //           color: AppColor.black26,
  //         ))),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  //           child: Column(
  //             children: [
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Text(
  //                               _jobsList[index].designation ?? '',
  //                               style: CustomTextStyles.text14SemiBoldW600,
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //                             SizedBox(width: 5.w,),
  //                             _jobsList[index].postedBy == AppConstants.myId
  //                                 ? GestureDetector(
  //                               onTap: () {
  //                                 Navigator.push(
  //                                   context,
  //                                   MaterialPageRoute(
  //                                     builder: (BuildContext context) {
  //                                       return PostJobScreen(
  //                                         dueDate: _jobsList[index].duaDate,
  //                                         designation:
  //                                         _jobsList[index].designation,
  //                                         jobLink: _jobsList[index].joblink,
  //                                         company:
  //                                         _jobsList[index].companyName,
  //                                         jobID: _jobsList[index].id,
  //                                       );
  //                                     },
  //                                   ),
  //                                 ).then((value) => getJobs());
  //
  //                                 // Get.to(
  //                                 //   () => PostJobScreen(
  //                                 //     dueDate: _jobsList[index].duaDate,
  //                                 //     designation:
  //                                 //         _jobsList[index].designation,
  //                                 //     jobLink: _jobsList[index].joblink,
  //                                 //     company: _jobsList[index].companyName,
  //                                 //     jobID: _jobsList[index].id,
  //                                 //   ),
  //                                 // )!
  //                                 //     .then((value) => getJobs());
  //                               },
  //                               child: const Icon(
  //                                 Icons.edit,
  //                                 size: 15,
  //                                 color: AppColor.primaryColor,
  //                               ),
  //                             )
  //                                 : Container(),
  //                           ],
  //                         ),
  //                         const SizedBox(
  //                           height: 2,
  //                         ),
  //                         Text(
  //                           _jobsList[index].companyName ?? '',
  //                           style: CustomTextStyles.text12RegularW400,
  //                         ),
  //                         Row(
  //                           children: [
  //                             Text(
  //                               'Published By: ',
  //                               style: CustomTextStyles.text12RegularW400,
  //                             ),
  //                             Text(
  //                               _jobsList[index].firstName ?? '',
  //                               style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //                             ),
  //                           ],
  //                         ),
  //                         Row(
  //                           children: [
  //                             Text(
  //                               'Due Date: ',
  //                               style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
  //                             ),
  //                             Text(
  //                               _jobsList[index].duaDate ?? '',
  //                               style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(height: 7.h,),
  //                         Column(
  //                           children: [
  //                             GestureDetector(
  //                               onTap: () {},
  //                               child: CustomWidget.linkBtn(
  //                                 title: AppConstants.link,
  //                                 onclick: () {
  //                                   setState(
  //                                         () {
  //                                       _launched = _launchInBrowser(
  //                                           _jobsList[index].joblink ?? '');
  //                                     },
  //                                   );
  //                                 },
  //                               ),
  //                             ),
  //                             _jobsList[index].postedBy == AppConstants.myId
  //                                 ? const SizedBox(
  //                               width: 5,
  //                             )
  //                                 : const SizedBox(),
  //
  //                             // _jobsList[index].postedBy == AppConstants.myId
  //                             //     ? GestureDetector(
  //                             //   onTap: () {
  //                             //     Navigator.push(
  //                             //       context,
  //                             //       MaterialPageRoute(
  //                             //         builder: (BuildContext context) {
  //                             //           return PostJobScreen(
  //                             //             dueDate: _jobsList[index].duaDate,
  //                             //             designation:
  //                             //             _jobsList[index].designation,
  //                             //             jobLink: _jobsList[index].joblink,
  //                             //             company:
  //                             //             _jobsList[index].companyName,
  //                             //             jobID: _jobsList[index].id,
  //                             //           );
  //                             //         },
  //                             //       ),
  //                             //     ).then((value) => getJobs());
  //                             //     // Get.to(
  //                             //     //   () => PostJobScreen(
  //                             //     //     dueDate: _jobsList[index].duaDate,
  //                             //     //     designation:
  //                             //     //         _jobsList[index].designation,
  //                             //     //     jobLink: _jobsList[index].joblink,
  //                             //     //     company: _jobsList[index].companyName,
  //                             //     //     jobID: _jobsList[index].id,
  //                             //     //   ),
  //                             //     // )!
  //                             //     //     .then((value) => getJobs());
  //                             //   },
  //                             //   child: const Icon(
  //                             //     Icons.edit,
  //                             //     color: AppColor.primaryColor,
  //                             //   ),
  //                             // )
  //                             //     : Container(),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //
  //                   // Row(
  //                   //   children: [
  //                   //     GestureDetector(
  //                   //       onTap: () {},
  //                   //       child: CustomWidget.linkBtn(
  //                   //         title: AppConstants.link,
  //                   //         onclick: () {
  //                   //           setState(
  //                   //             () {
  //                   //               _launched = _launchInBrowser(
  //                   //                   _jobsList[index].joblink ?? '');
  //                   //             },
  //                   //           );
  //                   //         },
  //                   //       ),
  //                   //     ),
  //                   //     _jobsList[index].postedBy == AppConstants.myId
  //                   //         ? const SizedBox(
  //                   //             width: 5,
  //                   //           )
  //                   //         : const SizedBox(),
  //                   //     _jobsList[index].postedBy == AppConstants.myId
  //                   //         ? GestureDetector(
  //                   //             onTap: () {
  //                   //               Navigator.push(
  //                   //                 context,
  //                   //                 MaterialPageRoute(
  //                   //                   builder: (BuildContext context) {
  //                   //                     return PostJobScreen(
  //                   //                       dueDate: _jobsList[index].duaDate,
  //                   //                       designation:
  //                   //                           _jobsList[index].designation,
  //                   //                       jobLink: _jobsList[index].joblink,
  //                   //                       company:
  //                   //                           _jobsList[index].companyName,
  //                   //                       jobID: _jobsList[index].id,
  //                   //                     );
  //                   //                   },
  //                   //                 ),
  //                   //               ).then((value) => getJobs());
  //                   //               // Get.to(
  //                   //               //   () => PostJobScreen(
  //                   //               //     dueDate: _jobsList[index].duaDate,
  //                   //               //     designation:
  //                   //               //         _jobsList[index].designation,
  //                   //               //     jobLink: _jobsList[index].joblink,
  //                   //               //     company: _jobsList[index].companyName,
  //                   //               //     jobID: _jobsList[index].id,
  //                   //               //   ),
  //                   //               // )!
  //                   //               //     .then((value) => getJobs());
  //                   //             },
  //                   //             child: const Icon(
  //                   //               Icons.edit,
  //                   //               color: AppColor.primaryColor,
  //                   //             ),
  //                   //           )
  //                   //         : Container(),
  //                   //   ],
  //                   // ),
  //                 ],
  //               ),
  //
  //               // const SizedBox(
  //               //   height: 3,
  //               // ),
  //               // Row(
  //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               //   children: [
  //               //     Row(
  //               //       children: [
  //               //         Text(
  //               //           'Due Date: ',
  //               //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
  //               //         ),
  //               //         Text(
  //               //           _jobsList[index].duaDate ?? '',
  //               //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //               //         ),
  //               //       ],
  //               //     ),
  //               //     Row(
  //               //       children: [
  //               //         Text(
  //               //           'Published By: ',
  //               //           style: CustomTextStyles.text12RegularW400,
  //               //         ),
  //               //         Text(
  //               //           _jobsList[index].firstName ?? '',
  //               //           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //               //         ),
  //               //       ],
  //               //     ),
  //               //   ],
  //               // ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // Widget _myJob() {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: ListView.builder(
  //       itemCount: _myJobs.length,
  //       itemBuilder: (context, index) {
  //         return Container(
  //           decoration: const BoxDecoration(
  //             border: Border(
  //               top: BorderSide(
  //                 color: AppColor.black26,
  //               ),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 3),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           _myJobs[index].designation ?? '',
  //                           style: CustomTextStyles.text14SemiBoldW600,
  //                         ),
  //                         const SizedBox(
  //                           height: 2,
  //                         ),
  //                         Text(
  //                           _myJobs[index].companyName ?? '',
  //                           style: CustomTextStyles.text12RegularW400,
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       children: [
  //                         CustomWidget.linkBtn(title: AppConstants.link),
  //                         _myJobs[index].postedBy == AppConstants.myId
  //                             ? const SizedBox(
  //                                 width: 5,
  //                               )
  //                             : const SizedBox(),
  //                         _myJobs[index].postedBy == AppConstants.myId
  //                             ? GestureDetector(
  //                                 onTap: () {
  //                                   Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (BuildContext context) {
  //                                         return PostJobScreen(
  //                                           dueDate: _myJobs[index].duaDate,
  //                                           designation:
  //                                               _myJobs[index].designation,
  //                                           jobLink: _myJobs[index].joblink,
  //                                           company: _myJobs[index].companyName,
  //                                           jobID: _myJobs[index].id,
  //                                         );
  //                                       },
  //                                     ),
  //                                   ).then((value) => getJobs());
  //                                   // Get.to(
  //                                   //   () => PostJobScreen(
  //                                   //     dueDate: _myJobs[index].duaDate,
  //                                   //     designation: _myJobs[index].designation,
  //                                   //     jobLink: _myJobs[index].joblink,
  //                                   //     company: _myJobs[index].companyName,
  //                                   //     jobID: _myJobs[index].id,
  //                                   //   ),
  //                                   // )!
  //                                   //     .then((value) => getJobs());
  //                                 },
  //                                 child: const Icon(
  //                                   Icons.edit,
  //                                   color: AppColor.primaryColor,
  //                                 ),
  //                               )
  //                             : Container(),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(
  //                   height: 3,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Text(
  //                           'Due Date: ',
  //                           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.greyshade500,),
  //                         ),
  //                         Text(
  //                           _myJobs[index].duaDate ?? '',
  //                           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //                         ),
  //                       ],
  //                     ),
  //                     Row(
  //                       children: [
  //                         Text(
  //                           'Published By: ',
  //                           style: CustomTextStyles.text12RegularW400,
  //                         ),
  //                         Text(
  //                           _myJobs[index].firstName ?? '',
  //                           style: CustomTextStyles.text12RegularW400.copyWith(color: AppColor.primaryColor,),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Future<void> setDataFromDB() async {
    _jobsList = await database.getJobs();
    _jobsList = _jobsList.reversed.toList();
    _myJobs = await database.getMyJobs(AppConstants.myId);
  }

  Future<void> getJobs() async {
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.addJobs();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }

}
