import 'package:flutter/material.dart';
import 'package:short_video_tiktok/widget/video_item.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          physics: const PageScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            print(index);
            return VideoItem(
              videoPlayerController:
                  VideoPlayerController.asset("assets/video_${index + 1}.mp4"),
              looping: true,
              autoplay: true,
            );
          }),
    );
  }
}
