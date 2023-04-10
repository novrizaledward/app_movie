import 'dart:developer';

import 'package:app_movie/src/data/models/video_model.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../config/config.dart';

class FramePlayer extends StatefulWidget {
  final List<VideoModel>? item;
  const FramePlayer({super.key, this.item});

  @override
  State<FramePlayer> createState() => _FramePlayerState();
}

class _FramePlayerState extends State<FramePlayer> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(widget.item![0].url!);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      aspectRatio: 16 / 9,
      looping: true,
      fullScreenByDefault: true,
      showOptions: false,
    );
    Wakelock.toggle(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: ConfigSize.only(bottom: 10),
          height: 200,
          width: ConfigSize.width(context),
          child: Chewie(
            controller: chewieController!,
          ),
        ),
        Container(
          margin: ConfigSize.symetric(
            vertical: 10,
          ),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.item!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: ConfigSize.symetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ConfigColor.primary),
                  onPressed: () {
                    log(widget.item![index].url!);
                    initializeVideoPlayer(widget.item![index].url!);
                    chewieController = ChewieController(
                      videoPlayerController: videoPlayerController!,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      looping: true,
                      fullScreenByDefault: true,
                      showOptions: false,
                    );
                  },
                  child: Text(
                    widget.item![index].title!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    videoPlayerController = VideoPlayerController.network(
      videoUrl,
    );
    await Future.wait([videoPlayerController!.initialize()]);
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    Wakelock.toggle(enable: false);
    super.dispose();
  }
}
