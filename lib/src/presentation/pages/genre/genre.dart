import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/genre/genre_bloc.dart';
import '../../widgets/ads/custom_native_ads.dart'; 

class GenrePage extends StatelessWidget {
  const GenrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<GenreBloc, GenreState>(
        builder: (context, state) {
          if (state is GenreWaiting) {}
          if (state is GenreError) {}
          if (state is GenreLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                if (index == 1 || index == 15) {
                  return const CustonNativeAds();
                } else {
                  return Container();
                }
              },
              itemCount: state.genreRespone.itemGenre!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = state.genreRespone.itemGenre![index];
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, stateAuth) {
                    if (stateAuth is AuthLoaded) {
                      return InkWell(
                        onTap: () {
                          context.read<AdsBloc>().add(LoadPushNamedRoute(
                                context: context,
                                entity: stateAuth.authEntity,
                                path: ConfigRoute.byGenre,
                                slug: data.slug,
                              ));
                        },
                        child: Container(
                          margin: ConfigSize.symetric(vertical: 5),
                          width: ConfigSize.width(context),
                          height: 100,
                          color: ConfigColor.subDark,
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              Opacity(
                                opacity: 0.15,
                                child: CacheImage(
                                  url: data.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Center(
                                  child: Text(
                                data.name!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ))
                            ],
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                );
              },
            );
          }
          return Container();
        },
      )),
    );
  }
}
