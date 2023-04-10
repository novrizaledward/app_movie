import 'package:app_movie/src/data/models/movie_model.dart';

import 'auth_entity.dart';
// import 'package:app_movie/src/data/models/series_model.dart';

class ScreenArgument {
  final MovieRespone? movieRespone;
  final MovieRespone? seriesRespone;
  final String? slug;
  final String? videoId;
  final AuthEntity? authEntity;

  ScreenArgument({
    this.seriesRespone,
    this.movieRespone,
    this.slug,
    this.videoId,
    this.authEntity,
  });
}
