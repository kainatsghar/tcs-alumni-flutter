import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iobm/utils/app_color.dart';

class ChatAudioPlayer extends StatefulWidget {
  final String url;
  final String user;
  const ChatAudioPlayer({
    Key? key,
    required this.url,
    required this.user,
  }) : super(key: key);

  @override
  State<ChatAudioPlayer> createState() => _ChatAudioPlayerState();
}

class _ChatAudioPlayerState extends State<ChatAudioPlayer> {
  var audio = AudioPlayer();
  int? maxDuration = 0;

  bool isPlaying = false;
  String currentPostLabel = "00:00";
  int currentPos = 0;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      audio.onDurationChanged.listen((Duration d) {
        //get the duration of audio

        setState(() {
          maxDuration = d.inMilliseconds;
        });
      });
      audio.onPositionChanged.listen(
        (Duration p) {
          currentPos =
              p.inMilliseconds; //get the current position of playing audio

          //generating the duration label
          int sHours = Duration(milliseconds: currentPos).inHours;
          int sMinutes = Duration(milliseconds: currentPos).inMinutes;
          int sSeconds = Duration(milliseconds: currentPos).inSeconds;

          int rHours = sHours;
          int rMinutes = sMinutes - (sHours * 60);
          int rSeconds = sSeconds - (sMinutes * 60 + sHours * 60 * 60);

          setState(() {
            currentPostLabel =
                "$rHours$rMinutes:${rSeconds < 10 ? "0$rSeconds" : rSeconds}";
          });
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              icon: isPlaying
                  ? const Icon(Icons.pause)
                  : const Icon(Icons.play_arrow),
              iconSize: 25.h,
              color: widget.user == 'sender' ? AppColor.white : AppColor.black,
              onPressed: () async {
                if (isPlaying) {
                  await audio.pause();
                  setState(() => isPlaying = false);
                } else {
                  await audio.play(AssetSource(widget.url));
                  setState(() => isPlaying = true);
                }
              }),
          SizedBox(
            width: 140.w,
            child: Slider(
              activeColor:
                  widget.user == 'sender' ? AppColor.white : AppColor.black,
              inactiveColor: Colors.grey,
              max: double.parse(maxDuration.toString()),
              min: 0,
              value: double.parse(currentPos.toString()),
              onChanged: (value) async {
                int seekVal = value.round();
                await audio.seek(Duration(milliseconds: seekVal));
                currentPos = seekVal;
                audio.onPlayerComplete.listen((event) {
                  setState(() => isPlaying = false);
                });
              },
            ),
          ),
          Text(
            currentPostLabel,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: widget.user == 'sender' ? AppColor.white : AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
