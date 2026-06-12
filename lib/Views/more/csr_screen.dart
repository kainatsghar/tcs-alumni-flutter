import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/networkcalls/response_models/insert_csr_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:iobm/utils/strings.dart';
import 'package:iobm/utils/text_styles.dart';

class CsrScreen extends StatefulWidget {
  const CsrScreen({Key? key}) : super(key: key);

  @override
  _CsrScreenState createState() => _CsrScreenState();
}

class _CsrScreenState extends State<CsrScreen> {
  late List<DBCSR> _csrs;

  bool dataFetched = false;
  bool wait = false;

  @override
  void initState() {
    setDataFromDB();
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        getCSRList();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: SecAppBar(
          title: const Text(Strings.csr),
          context: context,
        ),
        body: dataFetched
            ? Stack(
                children: [
                  Center(child: _bodyColumn()),
                  wait
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _bodyColumn() {
    return _csrs.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.csr,height: 180.h,width: 180.w,),
              const SizedBox(
                height: 25,
              ),
              Text(
                Strings.noCsrFound,
                style: CustomTextStyles.text14SemiBoldW600,
              ),
            ],
          )
        : ListView.separated(
            itemCount: _csrs.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: AppColor.grey,
                thickness: 1,
              );
            },
            itemBuilder: (context, index) {
              return dataTile(index);
            },
          );
  }

  Widget dataTile(index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _csrs[index].csrTitle ?? '',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _csrs[index].isInterested == 0
                  ? ElevatedButton(
                      onPressed: () {
                        showInterest(_csrs[index].csrId);
                      },
                      child: Text(
                        AppConstants.showInterest,
                        style: WidgetStyle.forgotTExtStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: AppColor.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColor.primaryColor,
                        ),
                        // minimumSize: MaterialStateProperty.all<Size>(
                        //   Size(10.w, 25.h),
                        // ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                        color: AppColor.black12,
                      ),
                      child: Text(
                        AppConstants.interested,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: AppColor.black,
                        ),
                      ),
                    )
            ],
          ),
          Text(
            _csrs[index].csrDescription ?? '',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(11),
              color: AppColor.black38,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Text(
                'From',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                _csrs[index].fromDate ?? '',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
              Text(
                'To ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                _csrs[index].toDate ?? '',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _csrs = await database.getCSR();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getCSRList() async {
    setState(() {
      wait = true;
    });
    DataFetched dataFetched = await ApiHelper.getCSRs();
    if (dataFetched.done) {
      setDataFromDB();
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> showInterest(id) async {
    UIHelper.apiCallingAlert(context);
    var response =
        await ApiCalls.insertCSR(userId: AppConstants.myId, csrId: id);
    UIHelper.hideApiCallingAlert(context);
    print(response);
    if (response is ErrorEntity) {
    } else {
      InsertCsrEntity csrEntity =
          InsertCsrEntity.fromJson(jsonEncode(response));
      if (csrEntity.success == 1) {
        database.editCSRInterest(id, 1);
        await setDataFromDB();
      }
    }
  }
}
