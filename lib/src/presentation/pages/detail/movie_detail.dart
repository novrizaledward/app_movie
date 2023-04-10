import 'package:app_movie/src/presentation/pages/detail/component/related_post.dart';
import 'package:app_movie/src/presentation/widgets/ads/custom_banner_ad.dart';
import 'package:app_movie/src/presentation/widgets/cache_image.dart';
import 'package:app_movie/src/presentation/widgets/frame_player.dart';
import 'package:app_movie/src/presentation/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

import '../../../commons/rating.dart';
import '../../../config/config.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/movie-detail/movie_detail_bloc.dart';
import '../../bloc/video/video_bloc.dart';
import '../../widgets/loading_shimmer_detail.dart';
import 'component/info_detail.dart';
import 'component/info_sinopsis.dart';
import 'component/tab_season.dart';

class MovieDetailPage extends StatefulWidget {
  final String? slug;
  const MovieDetailPage({super.key, this.slug});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  final RatingService _ratingService = RatingService();
  bool isMovie = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    context.read<MovieDetailBloc>().add(LoadMovieDetail(slug: widget.slug!));
        getIntValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MovieDetailBloc, MovieDetailState>(
          listener: (context, state) {
            if (state is MovieDetailLoaded) {
              if (state.movieDetailRespone.data!.season!.isEmpty) {
                context.read<VideoBloc>().add(LoadVideo(
                    id: state.movieDetailRespone.data!.info!.videoId!));
                isMovie = true;
              } else {
                isMovie = false;
              }
            }
          },
          builder: (context, state) {
            if (state is MovieDetailError) {
              return Center(child: Text(state.message));
            }
            if (state is MovieDetailWaiting) {
              return const LoadingShimmerDetail();
            }
            if (state is MovieDetailLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: isMovie
                        ? BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, stateAuth) {
                              if (stateAuth is AuthLoaded) {
                                if (stateAuth.authEntity.isOpen!) {
                                  return BlocBuilder<VideoBloc, VideoState>(
                                    builder: (context, state) {
                                      if (state is VideoWaiting) {
                                        return Container(
                                          margin: ConfigSize.only(bottom: 10),
                                          height: 250,
                                          color: ConfigColor.subDark,
                                          width: ConfigSize.width(context),
                                          child: const Center(
                                              child: LoadingCircle()),
                                        );
                                      }
                                      if (state is VideoError) {
                                        return Container(
                                          margin: ConfigSize.only(bottom: 10),
                                          height: 250,
                                          color: ConfigColor.subDark,
                                          width: ConfigSize.width(context),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.warning_rounded,
                                                size: 30,
                                              ),
                                              Text(
                                                "Sorry this video is unavailable",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2,
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
                                  );
                                } else {
                                  return CacheImage(
                                    url: state
                                        .movieDetailRespone.data!.info!.image!,
                                    height: 250,
                                    width: ConfigSize.width(context),
                                    fit: BoxFit.cover,
                                  );
                                }
                              }
                              return Container();
                            },
                          )
                        : CacheImage(
                            url: state.movieDetailRespone.data!.info!.image!,
                            height: 250,
                            width: ConfigSize.width(context),
                            fit: BoxFit.cover,
                          ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        infoDetail(
                          context,
                          state.movieDetailRespone.data!.info!.country!,
                          state.movieDetailRespone.data!.info!.duration!,
                          state.movieDetailRespone.data!.info!.rating!,
                          state.movieDetailRespone.data!.info!.title!,
                          state.movieDetailRespone.data!.info!.release!,
                          state.movieDetailRespone.data!.genre!,
                          isMovie,
                        ),
                        infoSinopsis(
                          context,
                          state.movieDetailRespone.data!.info!.sinopsis!,
                        ),
                        const CustomBannerAd(),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: isMovie
                        ? infoRelatedPost(
                            context,
                            state.movieDetailRespone.data!.relatePost!,
                          )
                        : Column(
                            children: [
                              tabTitle(context, tabController),
                              tabSeason(
                                context,
                                tabController,
                                state.movieDetailRespone.data!.season!,
                                state.movieDetailRespone.data!.relatePost!,
                              ),
                            ],
                          ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var count = prefs.getInt('welcome') ?? 0;

    count++;
    prefs.setInt('welcome', count);
    if (count == 4) {
      _ratingService.showRating();
    }
  }
}
