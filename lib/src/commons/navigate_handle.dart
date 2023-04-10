import 'package:app_movie/src/config/config.dart';
import 'package:flutter/material.dart';

import '../config/enum.dart';
import '../data/models/movie_model.dart';
// import '../data/models/series_model.dart';
import '../domain/entities/auth_entity.dart';
import '../domain/entities/screen_argument.dart';

class NavigateHandle {
  static byTypeRoute({
    required BuildContext context,
    required TypeRoute typeRoute,
    required String path,
    MovieRespone? movieRespone,
    MovieRespone? seriesRespone,
    String? slug,
    String? videoId,
    AuthEntity? authEntity,
  }) {
    if (typeRoute == TypeRoute.push) {
      return Navigator.pushNamed(context, path,
          arguments: ScreenArgument(
            movieRespone: movieRespone,
            seriesRespone: seriesRespone,
            slug: slug,
            videoId: videoId,
          ));
    } else if (typeRoute == TypeRoute.replace) {
      return Navigator.pushReplacementNamed(context, path,
          arguments: ScreenArgument(
              movieRespone: movieRespone,
              seriesRespone: seriesRespone,
              slug: slug,
              videoId: videoId,
              authEntity: authEntity));
    } else {
      return Navigator.pushNamed(context, ConfigRoute.blank);
    }
  }
}
