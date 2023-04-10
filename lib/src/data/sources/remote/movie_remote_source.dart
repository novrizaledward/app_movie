import 'dart:developer';

import 'package:app_movie/src/commons/exception.dart';
import 'package:app_movie/src/data/models/eps_detail_model.dart';
import 'package:app_movie/src/data/models/genre_model.dart';
import 'package:app_movie/src/data/models/movie_detail_model.dart';
import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/data/models/search_model.dart';
// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/data/models/video_model.dart';
import 'package:app_movie/src/data/models/year_model.dart';
import 'package:dio/dio.dart';

import '../../../config/config.dart';
import '../../models/new_release_model.dart';

abstract class MovieRemoteDataSource {
  Future<NewReleaseRespone> getNewRelease();
  Future<MovieRespone> getMovies(String page);
  Future<MovieRespone> getSeries(String page);
  Future<GenreRespone> getGenre();
  Future<MovieRespone> getByGenre(String genre, String page);
  Future<SearchRespone> getSearch(String keyword, String page);
  Future<YearRespone> getYear();
  Future<MovieRespone> getByYear(String year, String page);
  Future<MovieDetailRespone> getMovieDetail(String slug);
  Future<VideoRespone> getVideo(String id);
  Future<VideoRespone> getSeriesVideo(String id);
  Future<EpsDetailRespone> getEpsDetail(String slug);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  Dio get _client => Dio(BaseOptions(
        sendTimeout: 120000,
        contentType: 'application/json',
        baseUrl: ConfigApi.baseUrl,
      ));

  @override
  Future<NewReleaseRespone> getNewRelease() async {
    Response res = await _client.get(ConfigApi.newRelease);

    if (res.statusCode == 200) {
      return NewReleaseRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieRespone> getMovies(String page) async {
    Response res = await _client.get(ConfigApi.movies + page);

    if (res.statusCode == 200) {
      return MovieRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieRespone> getSeries(String page) async {
    Response res = await _client.get(ConfigApi.series + page);

    if (res.statusCode == 200) {
      return MovieRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GenreRespone> getGenre() async {
    Response res = await _client.get(ConfigApi.genre);

    if (res.statusCode == 200) {
      return GenreRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchRespone> getSearch(String keyword, String page) async {
    Response res = await _client.get('${ConfigApi.search}$keyword/$page');

    if (res.statusCode == 200) {
      return SearchRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieRespone> getByYear(String year, String page) async {
    Response res = await _client.get('${ConfigApi.itemsByYear}$year/$page');

    if (res.statusCode == 200) {
      return MovieRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<YearRespone> getYear() async {
    Response res = await _client.get(ConfigApi.year);

    if (res.statusCode == 200) {
      return YearRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailRespone> getMovieDetail(String slug) async {
    log(slug);
    Response res = await _client.get(ConfigApi.movieDetail + slug);

    if (res.statusCode == 200) {
      return MovieDetailRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VideoRespone> getVideo(String id) async {
    log(ConfigApi.movieVideo + id);
    Response res = await _client.get(ConfigApi.movieVideo + id);
    if (res.statusCode == 200) {
      return VideoRespone.fromJson(res.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EpsDetailRespone> getEpsDetail(String slug) async {
    Response res = await _client.get(ConfigApi.episodeDetail + slug);
    if (res.statusCode == 200) {
      return EpsDetailRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VideoRespone> getSeriesVideo(String id) async {
    Response res = await _client.get(ConfigApi.seriesVideo + id);
    if (res.statusCode == 200) {
      return VideoRespone.fromJson(res.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieRespone> getByGenre(String genre, String page) async {
    Response res = await _client.get("${ConfigApi.itemsByGenre}$genre/$page");

    if (res.statusCode == 200) {
      return MovieRespone.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }
}
