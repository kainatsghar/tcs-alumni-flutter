import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerPage extends StatefulWidget {
  final String url;

  const VideoPlayerPage({Key? key, required this.url}) : super(key: key);
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
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
          // height: MediaQuery.of(context).size.height * 0.8,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                _PlayPauseButton(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "0" + _controller.value.position.inMinutes.toString() + ":",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _controller.value.position.inSeconds < 10
                        ? "0${_controller.value.position.inSeconds}"
                        : _controller.value.position.inSeconds.toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                '/',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: AppColor.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    "0" + _controller.value.duration.inMinutes.toString() + ":",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _controller.value.duration.inSeconds < 10
                        ? "0${_controller.value.duration.inSeconds}"
                        : _controller.value.duration.inSeconds.toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: AppColor.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColor.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
        ),
      ],
    );
  }
}

/// Swiper
class SwiperVideoPlayer extends StatefulWidget {
  final String url;

  const SwiperVideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  _SwiperVideoPlayerState createState() => _SwiperVideoPlayerState();
}

class _SwiperVideoPlayerState extends State<SwiperVideoPlayer> {
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
          height: 250.h,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColor.white,
                    size: 100.0,
                  ),
                ),
                VideoProgressIndicator(_controller, allowScrubbing: false),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
