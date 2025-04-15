import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Views/news_feeds/create_post_screen.dart';
import 'package:iobm/controllers/tag_users_controller.dart';

import 'package:get/get.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

class TagUsersScreen extends StatefulWidget {
  final List<SelectableUser> tags;
  const TagUsersScreen({Key? key, required this.tags}) : super(key: key);

  @override
  _TagUsersScreenState createState() => _TagUsersScreenState();
}

class _TagUsersScreenState extends State<TagUsersScreen> {
  final TagController _tagController = Get.find();
  final TextEditingController _searchItems = TextEditingController();

  String keyword = '';
  @override
  void initState() {
    _searchItems.addListener(() {
      setState(() {
        keyword = _searchItems.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(_tagController.tagList.length);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tag People',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: AppColor.white),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20.0)),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: _bodyContainer(),
      ),
    );
  }

  Widget _bodyContainer() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              TextField(
                controller: _searchItems,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tags.length,
                itemBuilder: (context, index) {
                  if (widget.tags[index].allUser.firstName
                          .toString()
                          .toLowerCase()
                          .contains(keyword.toLowerCase()) ||
                      widget.tags[index].allUser.firstName
                          .toString()
                          .toUpperCase()
                          .contains(keyword.toUpperCase())) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.black12,
                          ),
                        ),
                      ),
                      // padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 6.w,
                          ),
                          _profilePicture(
                              widget.tags[index].allUser.image ?? '', index),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: _userinfo(
                              '${widget.tags[index].allUser.firstName} ${widget.tags[index].allUser.lastName}',
                              widget.tags[index].allUser.designation ?? '',
                              widget.tags[index].allUser.graduationYear ?? '',
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Checkbox(
                            value: widget.tags[index].isSelected,
                            onChanged: (value) {
                              setState(
                                () {
                                  widget.tags[index].isSelected = value!;
                                },
                              );
                              if (widget.tags[index].isSelected == true) {
                                _tagController
                                    .addUser(widget.tags[index].allUser);
                              } else {
                                _tagController
                                    .remove(widget.tags[index].allUser);
                              }
                            },
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  _userinfo(String name, String profession, String year) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(13),
            fontWeight: FontWeight.bold,
          ),
        ),
        profession != " , "
            ? Text(
                profession,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _profilePicture(String image, int index) {
    return SizedBox(
      height: 50,
      width: 50,
      child: CircleAvatar(
        child: image == ''
            ? const Image(
                image: AssetImage(AppImages.profile),
                width: 50,
                height: 50,
              )
            : CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Image(
            image: AssetImage(
              AppImages.noImage,
            ),
          ),
              ),
      ),
    );
  }
}
