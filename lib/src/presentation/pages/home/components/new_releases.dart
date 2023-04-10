import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/ads/ads_bloc.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/new_release/new_release_bloc.dart';
import '../../../widgets/label_item.dart';
import '../../../widgets/loading_shimmer_horizon.dart';
import '../../../widgets/preview_item.dart';

Widget newReleases() => BlocBuilder<AuthBloc, AuthState>(
      builder: (context, stateAuth) {
        if (stateAuth is AuthLoaded) {
          return Column(
            children: [
              Padding(
                padding: ConfigSize.symetric(horizontal: 15),
                child: LabelItem(
                  title: "Novo Lançamento",
                  onTap: () {
                    context.read<AdsBloc>().add(LoadPushNamedRoute(
                          context: context,
                          entity: stateAuth.authEntity,
                          path: ConfigRoute.allRelease,
                        ));
                  },
                ),
              ),
              BlocBuilder<NewReleaseBloc, NewReleaseState>(
                builder: (context, state) {
                  if (state is NewReleaseWaiting) {
                    return const LoadingShimmerHorizon();
                  }
                  if (state is NewReleaseError) {
                    return Container(
                        margin: ConfigSize.symetric(vertical: 10),
                        height: 290,
                        child: Center(child: Text(state.message)));
                  }
                  if (state is NewReleaseLoaded) {
                    return Container(
                      margin: ConfigSize.symetric(vertical: 10),
                      height: 290,
                      child: ListView.builder(
                        padding: ConfigSize.symetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          var data = state.newRelease.item![index];
                          return PreviewItem(
                            image: data.image,
                            title: data.title,
                            release: data.release,
                            onTap: () {
                              context.read<AdsBloc>().add(
                                    LoadPushNamedRoute(
                                        context: context,
                                        entity: stateAuth.authEntity,
                                        path: ConfigRoute.detailMovie,
                                        slug: data.slug),
                                  );
                            },
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          );
        }
        return Container();
      },
    );
