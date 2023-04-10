import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/ads/ads_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/movie/movie_bloc.dart';
import '../../../widgets/label_item.dart';
import '../../../widgets/loading_shimmer_horizon.dart';
import '../../../widgets/preview_item.dart';

Widget movieList() => BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieWaiting) {
          return Column(
            children: [
              Padding(
                  padding: ConfigSize.symetric(horizontal: 15),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoaded) {
                        return const LabelItem(
                          title: "Filmes",
                          onTap: null,
                        );
                      }
                      return Container();
                    },
                  )),
              const LoadingShimmerHorizon(),
            ],
          );
        }
        if (state is MovieError) {
          return Column(
            children: [
              Padding(
                  padding: ConfigSize.symetric(horizontal: 15),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoaded) {
                        return const LabelItem(
                          title: "Filmes",
                          onTap: null,
                        );
                      }
                      return Container();
                    },
                  )),
              Container(
                  margin: ConfigSize.symetric(vertical: 10),
                  height: 290,
                  child: Center(child: Text(state.message))),
            ],
          );
        }
        if (state is MoviesLoaded) {
          return Column(
            children: [
              Padding(
                  padding: ConfigSize.symetric(horizontal: 15),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, stateAuth) {
                      if (stateAuth is AuthLoaded) {
                        return LabelItem(
                          title: "Filmes",
                          onTap: () {
                            context.read<AdsBloc>().add(LoadPushNamedRoute(
                                  context: context,
                                  entity: stateAuth.authEntity,
                                  path: ConfigRoute.allMovie,
                                  movieRespone: state.movieItem,
                                ));
                          },
                        );
                      }
                      return Container();
                    },
                  )),
              Container(
                margin: ConfigSize.symetric(vertical: 10),
                height: 290,
                child: ListView.builder(
                  padding: ConfigSize.symetric(horizontal: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movieItem.itemMovie!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = state.movieItem.itemMovie![index];
                    return BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, stateAuth) {
                        if (stateAuth is AuthLoaded) {
                          return PreviewItem(
                            image: data.image,
                            title: data.title,
                            release: data.release,
                            onTap: () {
                              // GoAds.push(
                              //   context: context,
                              //   entity: stateAuth.authEntity,
                              //   path: ConfigRoute.detailMovie,
                              //   slug: data.slug,
                              // );

                              context.read<AdsBloc>().add(LoadPushNamedRoute(
                                    context: context,
                                    entity: stateAuth.authEntity,
                                    path: ConfigRoute.detailMovie,
                                    slug: data.slug,
                                  ));
                            },
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
