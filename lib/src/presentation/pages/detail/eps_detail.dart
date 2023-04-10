import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/data/models/info_eps_model.dart';
import 'package:app_movie/src/presentation/bloc/eps-detail/eps_detail_bloc.dart';
import 'package:app_movie/src/presentation/bloc/video/video_bloc.dart';
import 'package:app_movie/src/presentation/widgets/frame_player.dart';
import 'package:app_movie/src/presentation/widgets/loading_shimmer_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/ads/custom_banner_ad.dart';
import '../../widgets/loading_circle.dart';

class EpsDetail extends StatefulWidget {
  final String slug;
  const EpsDetail({super.key, required this.slug});

  @override
  State<EpsDetail> createState() => _EpsDetailState();
}

class _EpsDetailState extends State<EpsDetail> {
  @override
  void initState() {
    super.initState();
    context.read<EpsDetailBloc>().add(LoadEpsDetail(widget.slug));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<EpsDetailBloc, EpsDetailState>(
          listener: (context, state) {
            if (state is EpsDetailLoaded) {
              context.read<VideoBloc>().add(LoadSeriesVideo(
                  id: state.epsDetailRespone!.data!.info!.videoId!));
            }
          },
          builder: (context, state) {
            if (state is EpsDetailWaiting) {
              return const LoadingShimmerDetail();
            }
            if (state is EpsDetailError) {
              return Center(child: Text(state.message));
            }
            if (state is EpsDetailLoaded) {
              InfoEpsModel data = state.epsDetailRespone!.data!.info!;
              TextTheme theme = Theme.of(context).textTheme;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<VideoBloc, VideoState>(
                      builder: (context, state) {
                        if (state is VideoWaiting) {
                          return Container(
                            margin: ConfigSize.only(bottom: 10),
                            height: 250,
                            color: ConfigColor.subDark,
                            width: ConfigSize.width(context),
                            child: const Center(child: LoadingCircle()),
                          );
                        }
                        if (state is VideoError) {
                          return Container(
                            margin: ConfigSize.only(bottom: 10),
                            height: 250,
                            color: ConfigColor.subDark,
                            width: ConfigSize.width(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.warning_rounded,
                                  size: 30,
                                ),
                                Text(
                                  "Sorry this video is unavailable",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          );
                        }
                        if (state is VideoLoaded) {
                          return FramePlayer(
                            item: state.videoRespone.item,
                          );
                        }
                        return Container();
                      },
                    ),
                    Container(
                      margin: ConfigSize.symetric(horizontal: 15, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomBannerAd(),
                          Text(
                            data.title!,
                            style: theme.headline1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data.release!,
                            style: theme.subtitle2,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data.description!,
                            style: theme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
