 
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/series/series_bloc.dart';
import '../../../widgets/label_item.dart';
import '../../../widgets/loading_shimmer_horizon.dart';
import '../../../widgets/preview_item.dart';

Widget seriesList() => BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is SeriesWaiting) {
          return const LoadingShimmerHorizon();
        }
        if (state is SeriesError) {
          return Container(
              margin: ConfigSize.symetric(vertical: 10),
              height: 290,
              child: Center(child: Text(state.message)));
        }
        if (state is SeriesLoaded) {
          return Column(
            children: [
              Padding(
                  padding: ConfigSize.symetric(horizontal: 15),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, stateAuth) {
                      if (stateAuth is AuthLoaded) {
                        return LabelItem(
                          title: "Series",
                          onTap: () {
                            context.read<AdsBloc>().add(
                                  LoadPushNamedRoute(
                                    context: context,
                                    entity: stateAuth.authEntity,
                                    path: ConfigRoute.allSeries,
                                    seriesRespone: state.seriesRespone,
                                  ),
                                );
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
                  itemCount: state.seriesRespone.itemMovie!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = state.seriesRespone.itemMovie![index];
                    return BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, stateAuth) {
                        if (stateAuth is AuthLoaded) {
                          return PreviewItem(
                            image: data.image,
                            title: data.title,
                            release: data.release,
                            onTap: () {
                              context.read<AdsBloc>().add(LoadPushNamedRoute(
                                    context: context,
                                    entity: stateAuth.authEntity,
                                    path: ConfigRoute.detailMovie,
                                    slug: state
                                        .seriesRespone.itemMovie![index].slug,
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
