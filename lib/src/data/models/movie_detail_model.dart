import 'package:app_movie/src/data/models/info_movie_model.dart';
import 'package:app_movie/src/data/models/related_post_model.dart';
import 'package:app_movie/src/data/models/season_info_model.dart';

class MovieDetailRespone {
  MovieDetailModel? data;

  MovieDetailRespone({this.data});

  MovieDetailRespone.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? MovieDetailModel.fromJson(json['data']) : null;
  }
}

class MovieDetailModel {
  InfoMovieModel? info;
  List<String>? genre;
  List<RelatedPostModel>? relatePost = [];
  List<SeasonModel>? season = [];

  MovieDetailModel({this.info, this.genre, this.relatePost, this.season});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? InfoMovieModel.fromJson(json['info']) : null;
    genre = json['genre'].cast<String>();
    if (json['related_post'] != null) {
      relatePost = <RelatedPostModel>[];
      json['related_post'].forEach((v) {
        relatePost!.add(RelatedPostModel.fromJson(v));
      });
    }
    if (json['season'] != null) {
      season = <SeasonModel>[];
      json['season'].forEach((v) {
        season!.add(SeasonModel.fromJson(v));
      });
    }
  }
}
