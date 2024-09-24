import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/Widgets/widget_styles.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  bool? showLine = false;

  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidget.editPostAppbar(
          context: context,
          onPressed: () {
            print("Post edited...");
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userprofile(img: AppImages.profile, name: "James Bond"),
            Divider(
              thickness: 1.w,
            ),
            Flexible(
              child: emailTextField(),
            ),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: [
                    showLine!
                        ? Container(
                            height: 1,
                            color: AppColor.black,
                          )
                        : Container(),
                    bottomWidget(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  emailTextField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: _postController,
            onChanged: (val) {
              setState(() {
                showLine = true;
              });
            },
            decoration: const InputDecoration(
              prefixIconConstraints: BoxConstraints(
                minWidth: 23,
                maxHeight: 25,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(
                //Family: 'Nunito',
                fontSize: 16,
              ),
              hintText: "Share your thoughts",
              isDense: true,
            ))
      ],
    );
  }

  _userprofile({img, name}) {
    return Row(
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
          style: WidgetStyle.semiBoldText(fontSize: 16.sp, color: AppColor.black),
        ),
      ],
    );
  }

  _pictures(img) {
    return Stack(
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
                  //Family: 'Nunito',
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
