import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeFullScreenLive extends StatefulWidget {
  String? videoId;
  YoutubeFullScreenLive({Key? key, this.videoId}) : super(key: key);

  @override
  _YoutubeFullScreenLiveState createState() => _YoutubeFullScreenLiveState();
}

class _YoutubeFullScreenLiveState extends State<YoutubeFullScreenLive> {
  String? id;

  @override
  void initState() {
    id = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=HrrpR7zjFpU&ab_channel=GeoNews")!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: widget.videoId ?? '', //Add videoID.
                flags: const YoutubePlayerFlags(
                  isLive: true,
                  autoPlay: false,
                  mute: false,
                ),
              ),
            ),
            builder: (context, player) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  player,
                ],
              );
            },
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 22.w,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    ));
  }
}

class YoutubeFullScreen extends StatefulWidget {
  final String? videoId;
  const YoutubeFullScreen({Key? key, this.videoId}) : super(key: key);

  @override
  _YoutubeFullScreenState createState() => _YoutubeFullScreenState();
}

class _YoutubeFullScreenState extends State<YoutubeFullScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: widget.videoId ?? '', //Add videoID.
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
            ),
            builder: (context, player) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  player,
                ],
              );
            },
          ),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 22.w,
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      )  );
  }
}
