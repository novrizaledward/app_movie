import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/widgets/label_item.dart';
import 'package:app_movie/src/presentation/widgets/loading_shimmer_grid.dart';
import 'package:app_movie/src/presentation/widgets/preview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/by-year/by_year_bloc.dart';

Widget gridItemYear() {
  return BlocBuilder<ByYearBloc, ByYearState>(
    builder: (context, state) {
      if (state is ByYearLoaded) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, stateAuth) {
            if (stateAuth is AuthLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: ConfigSize.symetric(horizontal: 15),
                    child: LabelItem(
                      title: state.movieRespone.itemMovie![0].release,
                      onTap: () {
                        context.read<AdsBloc>().add(LoadPushNamedRoute(
                              context: context,
                              entity: stateAuth.authEntity,
                              path: ConfigRoute.byYearAll,
                              movieRespone: state.movieRespone,
                            ));
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.6,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.movieRespone.itemMovie!.length,
                    padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
                    itemBuilder: (BuildContext context, int index) {
                      var data = state.movieRespone.itemMovie![index];
                      return PreviewItem(
                        title: data.title,
                        image: data.image,
                        release: data.release,
                        onTap: () {
                          context.read<AdsBloc>().add(
                                LoadPushNamedRoute(
                                  context: context,
                                  entity: stateAuth.authEntity,
                                  path: ConfigRoute.detailMovie,
                                  slug:
                                      state.movieRespone.itemMovie![index].slug,
                                ),
                              );
                        },
                      );
                    },
                  ),
                ],
              );
            }
            return Container();
          },
        );
      }
      if (state is ByYearWaiting) {
        return const LoadingShimmerGrid(
          shrinkwrap: true,
          count: 6,
        );
      }
      return Container();
    },
  );
}
