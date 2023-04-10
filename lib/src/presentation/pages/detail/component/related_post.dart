import 'package:app_movie/src/presentation/bloc/movie-detail/movie_detail_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../../data/models/related_post_model.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../widgets/cache_image.dart';

Widget infoRelatedPost(BuildContext context, List<RelatedPostModel> post) {
  return Container(
    margin: ConfigSize.symetric(vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: ConfigSize.symetric(horizontal: 15),
          child: Text(
            "Postagem Relacionada",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: post.length,
            padding: ConfigSize.symetric(horizontal: 10),
            itemBuilder: (BuildContext context, int index) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, stateAuth) {
                  if (stateAuth is AuthLoaded) {
                    return Container(
                      width: 150,
                      margin: ConfigSize.symetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<MovieDetailBloc>()
                              .add(LoadMovieDetail(slug: post[index].path!));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CacheImage(
                            url: post[index].url!,
                            width: ConfigSize.width(context),
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
