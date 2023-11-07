import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoItem({
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
    Key? key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItem> {
  late ChewieController _chewieController;
  bool favorite = false;
  bool toSave = false;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      aspectRatio: 7 / 14,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: (MediaQuery.of(context).size.height) - 40,
      width: (MediaQuery.of(context).size.width),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Chewie(
            controller: _chewieController,
          ),
          Container(
            alignment: Alignment.centerRight,
            height: 430,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/200',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 22.0,
                          height: 23.0,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favorite = !favorite;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/heart-solid.svg",
                          height: 30,
                          width: 30,
                          colorFilter: ColorFilter.mode(
                              favorite ? Colors.red : Colors.white,
                              BlendMode.srcIn),
                        ),
                      ),
                      const Text(
                        "14k",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/comment.svg",
                        height: 30,
                        width: 30,
                        colorFilter:
                            const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      const Text(
                        "10k",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            toSave = !toSave;
                          });
                        },
                        child: SvgPicture.asset(
                          "assets/bookmark.svg",
                          height: 30,
                          width: 30,
                          colorFilter: ColorFilter.mode(
                              toSave ? Colors.orangeAccent : Colors.white,
                              BlendMode.srcIn),
                        ),
                      ),
                      const Text(
                        "19k",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/share.svg",
                        height: 30,
                        width: 30,
                        colorFilter:
                            const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      const Text(
                        "30k",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 35,
                    height: 35,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.green,
            height: 150,
            child: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Philips Ricardo',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'that last flight was long-haul',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '#bushcraft #build #camp',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '#pimple #fyp #pop #satisfying',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '#foryou #fyp #foryoupage #foryou',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note_sharp,
                        color: Colors.white,
                        weight: 8,
                      ),
                      Text(
                        'that last flight was long-haul',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
