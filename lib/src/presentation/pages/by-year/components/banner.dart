import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/widgets/loading_shimmer_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/by-year/by_year_bloc.dart';
import '../../../widgets/banner_headline.dart';

Widget bannerYear() {
  return BlocBuilder<ByYearBloc, ByYearState>(
    builder: (context, state) {
      if (state is ByYearLoaded) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, stateAuth) {
            if (stateAuth is AuthLoaded) {
              return BannerHeadline(
                image: state.movieRespone.itemMovie![0].image,
                title: state.movieRespone.itemMovie![0].title,
                type: state.movieRespone.itemMovie![0].quality,
                release: state.movieRespone.itemMovie![0].release,
                onTap: () {
                  context.read<AdsBloc>().add(
                        LoadPushNamedRoute(
                          context: context,
                          entity: stateAuth.authEntity,
                          path: ConfigRoute.detailMovie,
                          slug: state.movieRespone.itemMovie![0].slug,
                        ),
                      );
                },
              );
            }
            return Container();
          },
        );
      }
      if (state is ByYearWaiting) {
        return const LoadingShimmerBanner();
      }
      if (state is ByYearError) {
        return Container(
            margin: ConfigSize.symetric(vertical: 10),
            height: 290,
            child: Center(child: Text(state.message)));
      }
      return Container();
    },
  );
}
