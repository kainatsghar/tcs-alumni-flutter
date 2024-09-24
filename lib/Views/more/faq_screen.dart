import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/text_styles.dart';

import 'customexpansiontile.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool dataFetched = false;
  late List<DBFaq> _faqs;

  @override
  void initState() {
    _faqs = [];
    setDataFromDB();
    Future.delayed(const Duration(milliseconds: 100), () {
      getFaqs();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          titleTextStyle: CustomTextStyles.text16SemiBoldW600,
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
          shape: Border(bottom: BorderSide(color: AppColor.secAppBar, width: 3.w)),
          title: Text(
            'FAQ\'s',
            style: CustomTextStyles.text16SemiBoldW600,
          )),
      body: dataFetched
          ? _body()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: _faqs.length,
      itemBuilder: (context, index) {
        return _question(index);
      },
    );
  }

  Widget _question(int index) {
    return CustomExpansionTile(
      iconColor: AppColor.black26,
      collapsedIconColor: AppColor.black26,
      title: Text(
        _faqs[index].question ?? '',
        style: CustomTextStyles.text14SemiBoldW600.copyWith(color: AppColor.primaryColor,),
      ),
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: Text(
              _faqs[index].questionAnswer ?? '',
              style: CustomTextStyles.text12RegularW400,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> setDataFromDB() async {
    _faqs = await database.getFaqs();
    setState(() {
      dataFetched = true;
    });
  }

  Future<void> getFaqs() async {
    DataFetched dataFetched = await ApiHelper.getFaq();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }
}
