import 'package:app_movie/src/data/models/meta_model.dart';
import 'package:app_movie/src/domain/entities/movie_entity.dart';

class MovieRespone {
  List<MovieModel>? itemMovie;
  MetaModel? meta;

  MovieRespone({this.itemMovie, this.meta});

  MovieRespone.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      itemMovie = <MovieModel>[];
      json['data'].forEach((v) {
        itemMovie!.add(MovieModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
  }
}

class MovieModel extends MovieEntity {
  const MovieModel(
      {required String? title,
      required String? release,
      required String? quality,
      required String? slug,
      required String? image})
      : super(
          title: title,
          release: release,
          quality: quality,
          slug: slug,
          image: image,
        );

  MovieModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'],
          release: json['release'],
          quality: json['quality'],
          slug: json['slug'],
          image: json['image'],
        );
}
