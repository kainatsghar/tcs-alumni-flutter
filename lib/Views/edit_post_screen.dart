import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/utils/app_color.dart';

class EditPostScreen extends StatefulWidget {
  String? name;
  String? post;
  String? profileimage;
  String? postImage;
  EditPostScreen({this.name, this.post, this.profileimage, this.postImage});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.editPostAppbar(
          context: context,
          onPressed: () {
            print("Post edited...");
          }),
      body: Column(
        children: [
          _userprofile(img: widget.profileimage, name: widget.name),
          Divider(
            thickness: 1.w,
          ),
          _editPostBody(post: widget.post, postImage: widget.postImage),
          Expanded(child: Container()),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: bottomWidget(),
          )
        ],
      ),
    );
  }

  _userprofile({img, name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            //profile image
            backgroundImage: AssetImage(img),
            radius: 18.r,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            name,
            style:
                WidgetStyle.semiBoldText(fontSize: 16.sp, color: AppColor.black),
          ),
        ],
      ),
    );
  }

  _editPostBody({post, postImage}) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          Text(
            post,
            style: WidgetStyle.forgotTExtStyle(
                color: AppColor.greyshade800, fontSize: 14.sp),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10.h),
          _pictures(postImage),
        ],
      ),
    );
  }

  _pictures(img) {
    return img == '' || img == null
        ? SizedBox()
        : Stack(
            children: [
              Image(
                image: AssetImage(img),
              ), //scale: 1.85
              Positioned(
                  left: 140.w,
                  child: const Icon(
                    Icons.close,
                    color: AppColor.white,
                  ))
            ],
          );
  }

  bottomWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration.collapsed(
                hintText: 'Add to your post',
                hintStyle: TextStyle(
                    // //Family: 'Nunito',
                    fontSize: 15.sp)),
          )),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.camera_enhance,
            color: AppColor.greyshade600,
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.attach_file,
            color: AppColor.greyshade600,
          ),
          SizedBox(
            width: 10.w,
          ),
          Icon(
            Icons.person_add_alt_1,
            color: AppColor.greyshade600,
          )
        ],
      ),
    );
  }
}
