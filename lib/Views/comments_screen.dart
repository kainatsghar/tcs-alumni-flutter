import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/Widgets/custom_widgets.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:iobm/utils/app_images.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<String>? names = ["Chris James", "Francine", "Biance", "James", "Jhon"];
  List<String>? commentList = [
    'Crass eu elit, placer due ut, tindintal nishl, Nulla leo elit, Pharatera bibendum asf asf',
    'Crass eu elit, placer due ut, tindintal asf asf',
    'Crass eu elit, placer due ut, tindintal nishl, Nulla leo elit, Pharatera bibendum asf asf  Nulla leo elit, Pharatera bibendum asf asf',
    ' Nulla leo elit, Pharatera bibendum asf asf  Nulla leo elit, Pharatera bibendum asf asf  Nulla leo elit, Pharatera bibendum asf asf  Nulla leo elit, Pharatera bibendum asf asf  Nulla leo elit, Pharatera bibendum asf asf',
    ' Nulla leo elit, Pharatera bibendum asf asf'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: CustomWidget.reportAppBar(
          actionText: "",
          title: "Comment",
          onSubmitPressed: () {
            print("not to do anything");
          },
          context: context,
        ),
        body: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              // List of messages
              Flexible(
                  child: ListView.builder(
                      itemCount: names!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return comment(
                          name: names![index],
                          image: AppImages.profile,
                          time: '2 days ago',
                          commentText: commentList![index],
                        );
                      })),
              // Flexible(
              //     child:
              //      Column(
              //   children: [
              // comment(
              //   name: 'Chris James',
              //   image: 'assets/images/profile.png',
              //   time: '2 days ago',
              //   postText:
              //       'Crass eu elit, placer due ut, tindintal nishl, Nulla leo elit, Pharatera bibendum asf asf',
              // ),
              //   ],
              // )),
              buildInput(),
            ],
          ),
        ])));
  }

  comment({String? name, String? image, String? time, String? commentText}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            //profile image
            backgroundImage: AssetImage(image!),
            radius: 20.r,
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColor.greyshade200,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name!,
                        style: TextStyle(
                            // //Family: 'Nunito',
                            fontSize: 13.sp,
                            color: AppColor.greyshade700,
                            fontWeight: FontWeight.bold)),
                    Text(
                      time!,
                      style: TextStyle(
                        // //Family: 'Nunito',
                        fontSize: 11.sp,
                        color: AppColor.greyshade600,
                      ),
                    )
                  ],
                ),
                Text(
                  commentText!,
                  style: TextStyle(
                      // //Family: 'Nunito',
                      fontSize: 13.sp,
                      color: AppColor.greyshade800),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

Widget buildInput() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
        border:
            Border(top: BorderSide(color: AppColor.greyshade300, width: 0.5)),
        color: AppColor.white),
    child: Row(
      children: <Widget>[
        // Edit text
        const Flexible(
          child: TextField(
            decoration: InputDecoration.collapsed(
              hintText: 'Add Comment',
              hintStyle: TextStyle(
                  // fontFamily: 'Nunito'
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.send,
            color: AppColor.redshade900,
          ),
          padding: EdgeInsets.zero,
        )
      ],
    ),
  );
}
