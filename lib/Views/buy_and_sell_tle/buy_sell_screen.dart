import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iobm/Views/buy_and_sell_tle/add_product_screen.dart';
import 'package:iobm/Views/buy_and_sell_tle/product_detail_screen.dart';
import 'package:iobm/Widgets/app_bar.dart';
import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/local_db/local_db.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/response_models/categories_entity.dart';
import 'package:iobm/utils/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/data_fetched.dart';
import '../../networkcalls/api_helper.dart';
import '../../networkcalls/response_models/add_to_favourite_entity.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  final TextEditingController _searchItems = TextEditingController();
  String keyword = '';
  String branchName = '';

  late List<DBProduct> _products;

  late List<DBProductCategorie> _categories;

  late Future _fetchData;
  bool dataFetched = false;
  bool wait = false;

  int selectedSlotIndex = 0;
  String? catId;

  @override
  void initState() {
    _products = [];
    _categories = [];
    _searchItems.addListener(() {
      setState(() {
        keyword = _searchItems.text;
      });
    });
    _fetchData = getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: MyAppBar(
          title: Text(
            'Buy and Sell',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          context: context,
        ),
        body: FutureBuilder(
          future: _fetchData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _bodyColumn();
            } else {
              return Stack(
                children: [
                  _bodyColumn(),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            Get.to(
              () => const AddProductScreen(
                productId: "",
              ),
            )!
                .then((value) => setDataFromDB());
          },
        ),
      ),
    );
  }

  Widget _bodyColumn() {
    return DefaultTabController(
      length: branchName == "Premium" ? 4 : 3,
      child: Column(
        children: [
          _tabWidget(),
          const SizedBox(
            height: 10,
          ),
          searchBar(),
          const SizedBox(
            height: 10,
          ),
          _categoryRow(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              child: TabBarView(
                children: [
                  _otherWidget(),
                  _myWidget(),
                  _favProducts(),
                  if (branchName == "Premium") _premiumWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabWidget() {
    return Container(
      color: AppColor.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: AppColor.primaryColor,
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          fontWeight: FontWeight.w400,
          fontFamily: 'Gotham',
        ),
        labelColor: AppColor.primaryColor,
        unselectedLabelColor: AppColor.grey,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          const Tab(text: 'All Products'),
          const Tab(text: 'My Products'),
          const Tab(text: 'Fav Products'),
          if (branchName == "Premium") const Tab(text: 'Premium Products'),
        ],
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      controller: _searchItems,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
      ),
      textCapitalization: TextCapitalization.words,
      onEditingComplete: () {},
      onChanged: (name) {},
      //controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(14),
          color: AppColor.black38,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _categoryRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        height: 30.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  setState(() {
                    _products.clear();

                    selectedSlotIndex = index;
                    catId = _categories[index].id.toString();
                  });
                  _products = await database.getCatProducts(catId.toString());
                },
                child: Container(
                  width: 90.w,
                  //padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(right: 10.w, left: 10.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedSlotIndex == index
                          ? AppColor.primaryColor
                          : Colors.grey.shade400.withOpacity(.5),
                      width: selectedSlotIndex == index ? 0.2 : 1,
                    ),
                    color: selectedSlotIndex == index
                        ? AppColor.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(25.w),
                  ),
                  child: Center(
                    child: Text(
                      "${_categories[index].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: selectedSlotIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _otherWidget() {
    if (_products.isEmpty) {
      return const Center(
        child: Text('No Products Found'),
      );
    } else {
      return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          if (_products[index]
              .productName
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase())) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => ProductDetailScreen(
                      productId: _products[index].id,
                    ),
                  )!
                      .then((value) => setDataFromDB());
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColor.black,
                        ),
                        child: CachedNetworkImage(
                          height: 200.w,
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                          imageUrl: _products[index].coverImage ?? '',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              strokeWidth: 1.5,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage(
                              AppImages.noImage,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _products[index].productName ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _products[index].description ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black45,
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
                                      _products[index].dueDate ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(15),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "PKR " +
                                      _products[index].productPrice.toString(),
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
                                  _products[index].cityName ?? '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.to(
            //         () => ProductDetailScreen(
            //           productId: _products[index].id,
            //         ),
            //       )!
            //           .then((value) => setDataFromDB());
            //     },
            //     child: Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Row(
            //         children: [
            //           CachedNetworkImage(
            //             height: 50.h,
            //             width: 80.w,
            //             imageUrl: _products[index].coverImage ?? '',
            //             progressIndicatorBuilder:
            //                 (context, url, downloadProgress) => Center(
            //               child: CircularProgressIndicator(
            //                 value: downloadProgress.progress,
            //                 strokeWidth: 1.5,
            //               ),
            //             ),
            //             errorWidget: (context, url, error) => const Image(
            //               image: AssetImage(
            //                 AppImages.noImage,
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           Expanded(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   _products[index].productName ?? '',
            //                   style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: ScreenUtil().setSp(13),
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 Text(
            //                   _products[index].description ?? '',
            //                   style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: ScreenUtil().setSp(12),
            //                   ),
            //                 ),
            //                 const SizedBox(
            //                   height: 5,
            //                 ),
            //                 Wrap(
            //                   children: [
            //                     Row(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Icon(Icons.location_on_outlined,
            //                             size: 14.r),
            //                         Text(
            //                           _products[index].cityName ?? '',
            //                           style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: ScreenUtil().setSp(12),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Row(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Icon(
            //                           Icons.calendar_today_outlined,
            //                           size: 13.r,
            //                         ),
            //                         const SizedBox(
            //                           width: 3,
            //                         ),
            //                         Text(
            //                           _products[index].dueDate ?? '',
            //                           style: TextStyle(
            //                             color: Colors.black,
            //                             fontSize: ScreenUtil().setSp(12),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     const SizedBox(
            //                       width: 10,
            //                     ),
            //                     Text(
            //                       'PKR ' +
            //                           _products[index].productPrice.toString(),
            //                       style: TextStyle(
            //                         color: Colors.black,
            //                         fontSize: ScreenUtil().setSp(12),
            //                       ),
            //                     )
            //                   ],
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          } else {
            return const SizedBox();
          }
        },
      );
    }
  }

  Widget _myWidget() {
    if (_products.isEmpty) {
      return const Center(
        child: Text('No Products Found'),
      );
    } else {
      return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          if (_products[index]
              .productName
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase())) {
            if (_products[index].addedBy == int.parse(AppConstants.myId)) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProductDetailScreen(
                        productId: _products[index].id,
                      ),
                    )!
                        .then((value) => setDataFromDB());
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.black,
                          ),
                          child: CachedNetworkImage(
                            height: 200.w,
                            fit: BoxFit.fitHeight,
                            width: double.infinity,
                            imageUrl: _products[index].coverImage ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.5,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(
                                AppImages.noImage,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products[index].productName ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _products[index].description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        _products[index].dueDate ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "PKR " +
                                        _products[index]
                                            .productPrice
                                            .toString(),
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
                                    _products[index].cityName ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return const SizedBox();
          }
        },
      );
    }
  }

  Widget _favProducts() {
    if (_products.isEmpty) {
      return const Center(
        child: Text('No Products Found'),
      );
    } else {
      return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          if (_products[index]
              .productName
              .toString()
              .toLowerCase()
              .contains(keyword.toLowerCase())) {
            if (_products[index].isFavourite == "Y") {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProductDetailScreen(
                        productId: _products[index].id,
                      ),
                    )!
                        .then((value) => setDataFromDB());
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColor.black,
                          ),
                          child: CachedNetworkImage(
                            height: 200.w,
                            fit: BoxFit.fitHeight,
                            width: double.infinity,
                            imageUrl: _products[index].coverImage ?? '',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                strokeWidth: 1.5,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Image(
                              image: AssetImage(
                                AppImages.noImage,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _products[index].productName ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _products[index].description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: ScreenUtil().setSp(14),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        _products[index].dueDate ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "PKR " +
                                        _products[index]
                                            .productPrice
                                            .toString(),
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
                                    _products[index].cityName ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return const SizedBox();
          }
        },
      );
    }
  }

  Widget _premiumWidget() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        if (_products[index]
            .productName
            .toString()
            .toLowerCase()
            .contains(keyword.toLowerCase())) {
          if (_products[index].isPremium == "Y") {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => ProductDetailScreen(
                      productId: _products[index].id,
                    ),
                  )!
                      .then((value) => setDataFromDB());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        height: 50.h,
                        width: 80.w,
                        imageUrl: _products[index].coverImage ?? '',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            strokeWidth: 1.5,
                          ),
                        ),
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage(
                            AppImages.noImage,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _products[index].productName ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(13),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _products[index].description ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(12),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      size: 14.h,
                                    ),
                                    Text(
                                      _products[index].cityName ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 14.h,
                                    ),
                                    Text(
                                      _products[index].dueDate ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'PKR ' +
                                      _products[index].productPrice.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> setDataFromDB() async {
    setState(() {
      _products.clear();
    });
    _categories = await database.getAllCategories();
    if (_categories.isNotEmpty) {
      catId = _categories.first.id.toString();
    }
    _products = await database.getCatProducts(catId.toString());
  }

  Future<void> getProducts() async {
    await getAllCategories();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    branchName = prefs.getString('branchName') ?? '';
    setDataFromDB();
    DataFetched dataFetched = await ApiHelper.getProducts();
    if (dataFetched.done) {
      setDataFromDB();
    }
  }

  Future<void> getAllCategories() async {
    var response = await ApiCalls.getCategories(
      userId: AppConstants.myId,
    );
    if (response is ErrorEntity) {
    } else {
      CategoriesEntity entity = CategoriesEntity.fromJson(jsonEncode(response));
      if (entity.success == 1) {
        await database.deleteAllCategories();
        await database.insertAllCategories(entity.result!);
      }
    }
  }

  void addToFavourite(id, fav) async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.addFavourite(
      id: id,
      status: fav == 'Y' ? "N" : "Y",
    );
    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
    } else {
      AddFavouriteEntity favouriteEntity =
          AddFavouriteEntity.fromJson(jsonEncode(response));
      if (favouriteEntity.success == 1) {
        await database.editFavProduct(
          productId: id,
          status: fav == 'Y' ? "N" : "Y",
        );
        fav == "N"
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
