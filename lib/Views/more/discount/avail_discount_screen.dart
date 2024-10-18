import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:iobm/Widgets/sec_appbar.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/data_fetched.dart';
import 'package:iobm/networkcalls/api_helper.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_utils.dart';
import 'package:iobm/utils/strings.dart';

import '../../../utils/app_images.dart';
import '../../../utils/text_styles.dart';
import 'offer_discount_screen.dart';

class AvailDiscount extends StatefulWidget {
  const AvailDiscount({Key? key}) : super(key: key);

  @override
  AvailDiscountState createState() => AvailDiscountState();
}

class AvailDiscountState extends State<AvailDiscount> {
  late List<DBDiscount> _discounts;

  bool wait = false;
  bool dataFetched = false;
  bool showFab = true;
  late Future dataFetch;

  ScrollController? controller;

  @override
  void initState() {
    _discounts = [];
    dataFetch = getDiscounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecAppBar(
        title: const Text(Strings.discountpartners),
        context: context,
      ),
      body: FutureBuilder(
        future: dataFetch,
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
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: showFab ? 1 : 0,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => const OfferDiscount(),
            );
          },
          backgroundColor: AppColor.primaryColor,
          child: const Icon(
            Icons.add,
            size: 30,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }

  Widget _bodyColumn() {
    return _discounts.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            //   controller: controller,
            itemCount: _discounts.length,
            itemBuilder: (BuildContext context, int i) {
              return _discountWidget(
                  title: '${_discounts[i].title}',
                  img: '${_discounts[i].image}',
                  city: _discounts[i].cityName ?? '',
                  address: '${_discounts[i].address}',
                  percent: '${_discounts[i].percentOff}',
                  cover: "${_discounts[i].coverImage}",
                  endDate: '${_discounts[i].toDate}',
                  codeName: '${_discounts[i].codeName}',
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.discountImg,
                  height: 250.h,
                  width: 250.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'No Discounts Available!',
                  style: TextStyle(fontSize: 16.sp, color: AppColor.grey),
                ),
              ],
            ),
          );
  }

  Widget _discountWidget({title, city, address, percent, endDate, img, cover, codeName}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                height: 150.w,
                width: double.infinity,
                imageUrl: cover,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(
                    AppImages.noImage,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.discount,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      percent,
                      style: CustomTextStyles.text12RegularW400,
                    ),
                  ),
                ),
              ),
              if(codeName != "")
              Positioned(
                top: 10,
                right: 5,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: RichText(
                      text:  TextSpan(
                        text: 'Promo: ',
                        style: CustomTextStyles.text12RegularW400,
                        children: [
                          TextSpan(
                            text: codeName,
                            style: CustomTextStyles.text12SemiBoldW600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: CachedNetworkImage(
                  //height: 60.w,
                  width: 65.w,
                  imageUrl: img,
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage(
                      AppImages.noImage,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: CustomTextStyles.text14SemiBoldW600.copyWith(color: Colors.grey.shade800,),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColor.primaryColor,
                          size: 15.0.w,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppUtils().calculateDiscountDifference(endDate) < 1
                              ? 'Expired'
                              : "${AppUtils().calculateDiscountDifference(endDate)} Days",
                          style: CustomTextStyles.text12SemiBoldW600.copyWith(color: AppColor.primaryColor,),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  city,
                  style: CustomTextStyles.text12SemiBoldW600.copyWith(color: Colors.grey.shade500,),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  address,
                  style: CustomTextStyles.text12RegularW400.copyWith(color: Colors.grey.shade500,),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> setDataFromDB() async {
    _discounts = await database.getDiscounts();
    if (mounted) {
      setState(() {
        dataFetched = true;
      });
    }
  }

  Future<void> getDiscounts() async {
    setState(() {
      wait = true;
    });
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.getDiscounts();
    if (dataFetched.done) {
      setDataFromDB();
    }
    setState(() {
      wait = false;
    });
  }

}
