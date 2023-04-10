
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/new_release/new_release_bloc.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/loading_shimmer_banner.dart';

Widget bannerHome() => BlocBuilder<NewReleaseBloc, NewReleaseState>(
      builder: (context, state) {
        if (state is NewReleaseWaiting) {
          return const LoadingShimmerBanner();
        }
        if (state is NewReleaseLoaded) {
          return Stack(
            children: [
              CacheImage(
                url: state.newRelease.item![0].image!,
                width: ConfigSize.width(context),
                height: 320,
                fit: BoxFit.cover,
              ),
              Container(
                width: ConfigSize.width(context),
                height: 320,
                decoration: BoxDecoration(
                  color: ConfigColor.dark,
                  gradient: LinearGradient(
                      colors: [
                        ConfigColor.dark,
                        ConfigColor.dark.withOpacity(0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.1, 0.7]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      state.newRelease.item![0].title!,
                      style: Theme.of(context).textTheme.headline2,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, stateAuth) {
                        if (stateAuth is AuthLoaded) {
                          return ElevatedButton(
                            onPressed: () {
                              context.read<AdsBloc>().add(LoadPushNamedRoute(
                                    context: context,
                                    entity: stateAuth.authEntity,
                                    path: ConfigRoute.detailMovie,
                                    slug: state.newRelease.item![0].slug,
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ConfigColor.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: ConfigSize.symetric(
                                horizontal: 40,
                                vertical: 0,
                              ),
                            ),
                            child: Text(
                              "Play",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          state.newRelease.item![0].type!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          state.newRelease.item![0].release!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
