import 'package:app_movie/src/presentation/widgets/loading_circle.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../config/config.dart';
import '../../bloc/video/video_bloc.dart';

class PlayerPage extends StatefulWidget {
  final String videoId;
  const PlayerPage({super.key, required this.videoId});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    // context.read<VideoBloc>().add(LoadVideo(id: widget.videoId));
    initializeVideoPlayer(widget.videoId);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      aspectRatio: 16 / 9,
      looping: true,
      isLive: false,
      showOptions: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<VideoBloc, VideoState>(
      listener: (context, state) {
        if (state is VideoLoaded) {}
      },
      builder: (context, state) {
        if (state is VideoLoaded) {
          return Container(
            margin: ConfigSize.only(bottom: 10),
            height: 250,
            width: ConfigSize.width(context),
            child: Chewie(controller: chewieController!),
            // child: Text(state.videoRespone.item![0].url!),
          );
        }
        if (state is VideoWaiting) {
          return const Center(
            child: LoadingCircle(),
          );
        }
        return Container();
      },
    ));
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
    super.dispose();
  }
}
