import 'dart:convert';

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:iobm/helper_classes/ui_helper.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/networkcalls/api_calls.dart';
import 'package:iobm/networkcalls/api_config.dart';
import 'package:iobm/networkcalls/response_models/add_product_entity.dart';
import 'package:iobm/networkcalls/response_models/upload_product_image_entity.dart';
import 'package:iobm/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../local_db/local_db.dart';

import '../../networkcalls/response_models/product_details_model.dart';
import '../../utils/app_color.dart';
import '../../utils/app_constants.dart';
import '../../utils/strings.dart';

class AddProductScreen extends StatefulWidget {
  final String? productId;

  const AddProductScreen({
    Key? key,
    this.productId,
  }) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  GlobalKey<FormState> forumKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late VideoPlayerController _controller;

  bool wait = false;

  bool isPremium = false;
  bool isAnonymous = false;
  String? branchName;
  String? branchId;

  late List<DBProductCategorie> _categories;

  var _categoryValue;

  final picker = ImagePicker();

  List imageFiles = [];

  late Future _fetchData;
  late Future _fetchData2;

  @override
  void initState() {
    _categories = [];
    _fetchData = getCategories();
    if (widget.productId != "") {
      _fetchData2 = _getDetails();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        print(_categoryValue);
      },
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Product',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ),
          body: FutureBuilder(
            future: _fetchData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (widget.productId == "") {
                  return _bodyContainer();
                } else {
                  return FutureBuilder(
                    future: _fetchData2,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return _bodyContainer();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                }
              } else {
                return Stack(
                  children: [
                    _bodyContainer(),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _imagesRow() {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imageFiles.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90.h,
                  width: 80.w,
                  child: imageFiles[index].toString().contains('mp4')
                      ? VideoPlayer(_controller)
                      : CachedNetworkImage(
                          height: 90.h,
                          width: 80.w,
                          fit: BoxFit.fill,
                          imageUrl: imageFiles[index].toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) {
                            return SizedBox(
                              height: 5,
                              width: 5,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  value: downloadProgress.progress,
                                ),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) => const Image(
                      image: AssetImage(
                        AppImages.noImage,
                      ),
                    ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      imageFiles.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColor.black,
                    size: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _bodyContainer() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: forumKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: _title('Upload Image')),
                    SizedBox(height: 10.h),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker();
                        },
                        child: Container(
                          width: 120.w,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            AppImages.uploadImage,
                            height: 28.w,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _imagesRow(),
                    _nameField(context),
                    const SizedBox(
                      height: 15,
                    ),
                    _priceField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _categoryField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _cityField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _quantityField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _descriptionField(),
                    branchName == 'Premium' ? _checkBoxes() : const SizedBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    _buttonsRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
        wait
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox()
      ],
    );
  }

  Widget _title(text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _nameField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Product Name *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Please write product name'
                  : null;
            },
            controller: _nameController,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
            ),
            decoration: InputDecoration(
              hintText: 'Samsung S8 plus',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _priceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Price *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Please enter price'
                  : null;
            },
            textInputAction: TextInputAction.next,
            controller: _priceController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
            ),
            decoration: InputDecoration(
              hintText: '50000',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _quantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Quantity *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Please enter quantity'
                  : null;
            },
            textInputAction: TextInputAction.next,
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
            ),
            decoration: InputDecoration(
              hintText: '10',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _cityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('City *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Please enter city'
                  : null;
            },
            textInputAction: TextInputAction.next,
            controller: _cityController,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
            ),
            decoration: InputDecoration(
              hintText: 'Lahore',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _descriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Description *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'Please write description'
                  : null;
            },
            textInputAction: TextInputAction.done,
            controller: _descriptionController,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(13),
            ),
            minLines: 6,
            maxLines: 50,
            decoration: InputDecoration(
              hintText: 'Write Here...',
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _checkBoxes() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              height: 10,
              child: Checkbox(
                  value: isPremium,
                  onChanged: (value) {
                    setState(() {
                      isPremium = value!;
                    });
                  }),
            ),
            Text(
              'Premium',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            SizedBox(
              height: 10,
              child: Checkbox(
                value: isAnonymous,
                onChanged: (value) {
                  setState(() {
                    isAnonymous = value!;
                  });
                },
                visualDensity: const VisualDensity(),
              ),
            ),
            Text(
              'Anonymous',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _categoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('Category *'),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: DropdownButtonFormField(
            value: _categoryValue,
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 13.sp),
              isDense: true,
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(13),
                color: Colors.black26,
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              return value == null ? 'Please select category' : null;
            },
            items: _categories.map(
              (itemValue) {
                return DropdownMenuItem(
                  value: itemValue.id,
                  child: Text(
                    itemValue.name ?? '',
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(() {
                _categoryValue = newValue;
              });
            },
            hint: Text(
              'Select Category',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: AppColor.greyshade400,
              ),
            ),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(14),
              color: AppColor.black,
            ),
            iconEnabledColor: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buttonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 120.w,
          // height: 30,
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20.0)),
              side: MaterialStateProperty.all<BorderSide>(
                 BorderSide(color: AppColor.primaryColor),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side:  BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              // minimumSize: MaterialStateProperty.all<Size>(Size(70.w, 20.h)),
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
          width: 20,
        ),
        SizedBox(
          width: 120.w,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side:  BorderSide(
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
            onPressed: () {
              if (forumKey.currentState!.validate()) {
                addProduct();
              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Please Select',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              ListTile(
                  minLeadingWidth: 5,
                  leading: const Icon(Icons.photo_library),
                  title: Text(
                    'Photo Library',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop(); //dismiss the dialog
                  }),
              ListTile(
                minLeadingWidth: 5,
                leading: const Icon(Icons.switch_video),
                title: Text(
                  'Video Library',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
                onTap: () {
                  // _imgFromCamera();
                  _videoFromGallery();
                  Navigator.of(context).pop(); //dismiss the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _imgFromGallery() async {
    List<XFile>? files = await picker.pickMultiImage(
      imageQuality: 50,
    );
    if (files != null) {
      List<File> temp = [];

      // for (var element in files) {
      //   setState(() {
      //     imageFiles.add(AppConstants.baseUrl +
      //         "uploads/product-attachments" +
      //         element.path);
      //     //  _images.add(File(element.path));
      //   });
      // }

      for (var element in files) {
        temp.add(
          File(element.path),
        );
      }

      for (var element in temp) {
        _uploadImage(element.path);
      }
    } else {}
  }

  // _imgFromCamera() async {
  //   XFile? file = await picker.pickImage(
  //     source: ImageSource.camera,
  //     imageQuality: 50,
  //   );
  //   if (file != null) {
  //     setState(() {
  //       _images.add(File(file.path));
  //     });
  //     _uploadImage(file.path);
  //   } else {}
  // }

  Future<void> _uploadImage(file) async {
    setState(() {
      wait = true;
    });
    Map<String, dynamic> map = {};
    var response = await NetworkCalls.uploadFileWithToken(
      url: 'api/upload_product_image',
      map: map,
      imagePath: file,
      param: "image",
    );
    if (response is ErrorEntity) {
      print(response.message);
    } else {
      UploadProdImageEntity fileResponse =
          UploadProdImageEntity.fromJson(jsonEncode(response));
      if (fileResponse.success == 1) {
        if (mounted) {
          setState(() {
            imageFiles.add(fileResponse.image!);
          });
        }

        print('image added');
      }
    }
    setState(() {
      wait = false;
    });
  }

  Future<void> getCategories() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    branchId = pref.getString('branchId');
    branchName = pref.getString('branchName');
    _categories = await database.getAllCategories();
  }

  Future<void> _getDetails() async {
    var response = await ApiCalls.getProductDetails(
      userId: AppConstants.myId,
      productId: widget.productId,
    );
    if (response is ErrorEntity) {
    } else {
      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(jsonEncode(response));
      if (productDetailsModel.success == 1) {
        print(productDetailsModel.result!.first.category);
        if (productDetailsModel.result!.first.coverImage!.isNotEmpty) {
          for (var element in productDetailsModel.result!.first.coverImage!) {
            imageFiles.add(element.productMedia);
            if (element.productMedia!.endsWith('mp4')) {
              _controller =
                  VideoPlayerController.network(element.productMedia ?? '')
                    ..initialize();
            }
          }
        }

        _nameController.text =
            productDetailsModel.result!.first.productName ?? '';
        _priceController.text =
            productDetailsModel.result!.first.productPrice ?? '';
        _descriptionController.text =
            productDetailsModel.result!.first.productDesc ?? '';
        _quantityController.text =
            productDetailsModel.result!.first.productQty ?? '';
        _cityController.text = productDetailsModel.result!.first.cityName ?? '';
        _categoryValue = int.parse(productDetailsModel.result!.first.category!);
      }
    }
  }

  Future<void> addProduct() async {
    UIHelper.apiCallingAlert(context);
    var response = await ApiCalls.insertProduct(
      userId: AppConstants.myId,
      productName: _nameController.text,
      productPrice: _priceController.text,
      cityName: _cityController.text,
      dueDate: DateTime.now().toString(),
      category: _categoryValue,
      productId: widget.productId,
      productQty: _quantityController.text,
      productDesc: _descriptionController.text,
      addedBy: AppConstants.myId,
      productMedia: jsonEncode(imageFiles),
      isAnonymous: isAnonymous ? 'Y' : 'N',
      isPremium: isPremium ? 'Y' : 'N',
    );

    UIHelper.hideApiCallingAlert(context);
    if (response is ErrorEntity) {
      UIHelper.showErrorAlert(context, response.message);
    } else {
      AddProductEntity productEntity =
          AddProductEntity.fromJson(jsonEncode(response));
      if (productEntity.success == 1) {
        DBProduct product = DBProduct(
          id: productEntity.productPost!.id ?? 0,
          cityName: productEntity.productPost!.cityName,
          productPrice: productEntity.productPost!.productPrice,
          productName: productEntity.productPost!.productName,
          addedBy: productEntity.productPost!.addedBy,
          postedBy: productEntity.productPost!.postedBy,
          category: productEntity.productPost!.category,
          productQuantity: productEntity.productPost!.productQty,
          description: productEntity.productPost!.productDesc,
          isActive: productEntity.productPost!.isActive,
          isAnonymous: productEntity.productPost!.isAnonymous,
          isPremium: productEntity.productPost!.isPremium,
          dueDate: productEntity.productPost!.dueDate,
          coverImage: imageFiles.isEmpty ? "" : imageFiles.first.toString(),
        );
        await database.insertProduct(product);
        await Fluttertoast.showToast(
            msg: 'Product has been added successfully');
        Get.back();
      }
    }
  }

  _videoFromGallery() async {
    XFile? file = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (file != null) {
      _controller = VideoPlayerController.network(file.path)..initialize();
      // setState(() {
      //   imageFiles.add(file.path);
      // });
      _uploadImage(file.path);
    }
  }
}
