import 'package:app_movie/src/config/config.dart';
import 'package:app_movie/src/presentation/bloc/ads/ads_bloc.dart';
import 'package:app_movie/src/presentation/widgets/preview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/new_release/new_release_bloc.dart';

class AllRelease extends StatelessWidget {
  const AllRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todos os novos lançamentos"),
        ),
        body: BlocBuilder<NewReleaseBloc, NewReleaseState>(
          builder: (context, state) {
            if (state is NewReleaseLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.6,
                ),
                itemCount: state.newRelease.item!.length,
                padding: ConfigSize.symetric(horizontal: 5, vertical: 10),
                itemBuilder: (BuildContext context, int index) {
                  var data = state.newRelease.item![index];
                  return BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, stateAuth) {
                      if (stateAuth is AuthLoaded) {
                        return PreviewItem(
                          title: data.title,
                          image: data.image,
                          release: data.release,
                          onTap: () {
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
              );
            }
            return Container();
          },
        ));
  }
}
