import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iobm/Views/buy_and_sell_tle/video_player_page.dart';

import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/add_to_favourite_entity.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_constants.dart';
import 'package:iobm/utils/app_images.dart';

import '../../controllers/profile_controller.dart';
import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';
import '../../utils/strings.dart';
import '../Chat/send_invation_screen.dart';
import 'FullMediaView.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProfileController _profileController = Get.find();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  late DBProduct _product;
  late List<DBProductImage> _productImages;
  late Future _fetchData;

  /// Ids
  var nums = [];
  String? largeId;
  String? smallId;

  bool wait = false;

  @override
  void initState() {
    _product = DBProduct(id: 9999);
    _productImages = [];
    _fetchData = getProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Detail',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _bodyContainer();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _bodyContainer();
            }
          },
        ),
      ),
    );
  }

  Widget _bodyContainer() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 250.h,
                          child: Stack(
                            children: [
                              _productImages.isNotEmpty
                                  ? Swiper(
                                      key: UniqueKey(),
                                      pagination: const SwiperPagination(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _productImages.length,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              () => FullMediaView(
                                                productImages: _productImages,
                                                imageIndex:
                                                    _productImages.indexOf(
                                                  _productImages[i],
                                                ),
                                              ),
                                            );
                                          },
                                          child: _productImages[i]
                                                  .productMedia!
                                                  .contains('.mp4')
                                              ? Container(
                                                  width: 250.h,
                                                  color: Colors.black,
                                                  child: SwiperVideoPlayer(
                                                    url: _productImages[i]
                                                            .productMedia ??
                                                        '',
                                                  ),
                                                  // child: VideoPlayerRemote(
                                                  //     url: _productImages[i]
                                                  //             .productMedia ??
                                                  //         '',
                                                  //     height: 250),
                                                )
                                              : Container(
                                                  width: 250.h,
                                                  color: Colors.black,
                                                  child: CachedNetworkImage(
                                                    height: 250.h,
                                                    imageUrl: _productImages[i]
                                                            .productMedia ??
                                                        '',
                                                    fit: BoxFit.fitHeight,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        color: AppColor
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Image(
                                                      image: AssetImage(
                                                        AppImages.noImage,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Image(
                                        image: AssetImage(AppImages.noImage),
                                      ),
                                    ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: IconButton(
                                  onPressed: () async {
                                    await addToFavourite();
                                    await setDataFromDB();
                                  },
                                  icon: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.white,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        _product.isFavourite == "Y"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 24.h,
                                        color: _product.isFavourite == "Y"
                                            ? Colors.red
                                            : Colors.black26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _product.productName ?? '',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _product.description ?? '',
                              style: TextStyle(
                                color: AppColor.grey,
                                fontSize: ScreenUtil().setSp(14),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.calenderIcon,
                                      height: 15.w,
                                      width: 15.w,
                                      color: AppColor.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      _product.dueDate ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "PKR " + _product.productPrice.toString(),
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppImages.locationIcon,
                                  height: 15.w,
                                  width: 15.w,
                                  color: AppColor.primaryColor,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  _product.cityName ?? '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Posted By : ",
                                  style: TextStyle(
                                    color: AppColor.grey,
                                    fontSize: ScreenUtil().setSp(15),
                                  ),
                                ),
                                Text(
                                  _product.postedBy.toString(),
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(15),
                                    decoration: TextDecoration.underline,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            _product.addedBy != int.parse(AppConstants.myId)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty
                                                  .all<EdgeInsetsGeometry>(
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0)),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  side:  BorderSide(
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              minimumSize: MaterialStateProperty
                                                  .all<Size>(Size(70.w, 20.h))),
                                          onPressed: () {
                                            Get.to(
                                              () => ChatInvitationScreen(
                                                receiverId:
                                                    _product.addedBy.toString(),
                                                name: _product.postedBy ?? '',
                                                image: '',
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Send Message',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(14),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: OutlinedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<
                                                    EdgeInsetsGeometry>(
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10.0)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side:  BorderSide(
                                                  color: AppColor.primaryColor,
                                                ),
                                              ),
                                            ),
                                            minimumSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(70.w, 20.h)),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return _dialog();
                                                });
                                          },
                                          child: Text(
                                            'Make an Offer',
                                            style: TextStyle(
                                              fontSize: ScreenUtil().setSp(14),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          wait
              ? Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _dialog() {
    return StatefulBuilder(
      builder: (context, setState) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        'Make an offer',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter Price*',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: _priceController,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Please write product name'
                              : null;
                        },
                        //controller: _nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                        ),

                        decoration: InputDecoration(
                          hintText: '20000',
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.greyshade200,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter Message*',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: _messageController,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Please write product name'
                              : null;
                        },
                        //controller: _nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                        ),
                        minLines: 4,
                        maxLines: 50,
                        decoration: InputDecoration(
                          hintText: 'White message here',
                          hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.greyshade200,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          child: OutlinedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(horizontal: 10.0)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side:  BorderSide(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(120.w, 20.h),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              Strings.cancel,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 10.0)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side:  BorderSide(
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(120.w, 40.h))),
                            onPressed: () async {
                              /// Chat add Collection
                              FirebaseFirestore.instance
                                  .collection('chats')
                                  .doc('chatsScreen')
                                  .collection('$largeId-$smallId')
                                  .doc(DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString())
                                  .set(
                                {
                                  'message':
                                      '${_priceController.text}*-${_messageController.text}*-${_product.productName}*-${_product.description}',
                                  "media_url": _product.coverImage,
                                  'messageId': _product.id.toString(),
                                  'messageKey': "$largeId-$smallId",
                                  "read": false,
                                  "received": true,
                                  "receiverId": "${_product.addedBy}",
                                  "send": true,
                                  "status": "",
                                  "senderId": AppConstants.myId,
                                  "type": 'offer',
                                  "timeStamp": DateFormat('yyyy/MM/dd HH:mm:ss')
                                      .format(DateTime.now()),
                                },
                              );

                              /// Message Keys Collection
                              FirebaseFirestore.instance
                                  .collection('messageKeys')
                                  .doc('keys')
                                  .collection(AppConstants.myId)
                                  .doc(_product.addedBy.toString())
                                  .set(
                                {
                                  "id": _product.addedBy.toString(),
                                  "imageUrl": "",
                                  "lastText": "Offer",
                                  "messageKey": "$largeId-$smallId",
                                  "name": _product.postedBy,
                                  "time": DateFormat('yyyy/MM/dd HH:mm:ss')
                                      .format(DateTime.now()),
                                },
                              );

                              /// Message Keys Collection
                              FirebaseFirestore.instance
                                  .collection('messageKeys')
                                  .doc('keys')
                                  .collection(_product.addedBy.toString())
                                  .doc(AppConstants.myId)
                                  .set({
                                "id": AppConstants.myId,
                                "imageUrl": _profileController.image,
                                "lastText": "Audio",
                                "messageKey": "$largeId-$smallId",
                                "name": AppConstants.userName,
                                "time": DateFormat('yyyy/MM/dd HH:mm:ss')
                                    .format(DateTime.now()),
                              });
                              Get.back();
                              await Fluttertoast.showToast(
                                  msg: 'Offer has been sent successfully');
                            },
                            child: Text(
                              'Send Offer',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> setDataFromDB() async {
    _product = await database.getSingleProduct(widget.productId);
    _productImages = await database.getSingleProductImages(widget.productId);
  }

  Future<void> getProductDetail() async {
    setDataFromDB();
    DataFetched dataFetched =
        await ApiHelper.getProductDetail(widget.productId.toString());
    if (dataFetched.done) {
      setDataFromDB();
      nums = [int.parse(AppConstants.myId), _product.addedBy];
      nums.sort();
      setState(() {
        largeId = nums.last.toString();
        smallId = nums.first.toString();
      });
    }
  }

  Future<void> addToFavourite() async {
    setState(() {
      wait = true;
    });
    var response = await ApiCalls.addFavourite(
      id: _product.id,
      status: _product.isFavourite == 'Y' ? "N" : "Y",
    );
    if (response is ErrorEntity) {
    } else {
      AddFavouriteEntity favouriteEntity =
          AddFavouriteEntity.fromJson(jsonEncode(response));
      if (favouriteEntity.success == 1) {
        await database.editFavProduct(
          productId: _product.id,
          status: _product.isFavourite == 'Y' ? "N" : "Y",
        );
        _product.isFavourite == "N"
            ? await Fluttertoast.showToast(
                msg: 'Product has been added to favourites')
            : await Fluttertoast.showToast(
                msg: 'Product has been removed from favourites');
      }
    }
    setState(() {
      wait = false;
    });
  }
}
