import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class StoryVideoPlayer extends StatefulWidget {
  final String url;

  const StoryVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  _StoryVideoPlayerState createState() => _StoryVideoPlayerState();
}

class _StoryVideoPlayerState extends State<StoryVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.url, //to access its parent class constructor or variable
    );

    _controller.addListener(() {
      setState(() {});
    });
    // _controller.setLooping(true); //loop through video
    _controller.initialize(); //initialize the VideoPlayer
  }

  @override
  void dispose() {
    _controller.dispose(); //dispose the VideoPlayer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 100.w,
          height: 160.w,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                // const Center(
                //   child: Icon(
                //     Icons.play_arrow,
                //     color: AppColor.white,
                //     size: 100.0,
                //   ),
                // ),
                VideoProgressIndicator(_controller, allowScrubbing: false),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
