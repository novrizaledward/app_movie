import 'package:app_movie/src/commons/failure.dart';
import 'package:app_movie/src/data/models/eps_detail_model.dart';
import 'package:app_movie/src/data/models/genre_model.dart';
import 'package:app_movie/src/data/models/movie_detail_model.dart';
import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/data/models/search_model.dart';
import 'package:app_movie/src/data/models/video_model.dart';
import 'package:app_movie/src/data/models/year_model.dart';
import 'package:app_movie/src/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/new_release_model.dart';

class MovieUsecase {
  final MovieRepository _movieRepository;

  MovieUsecase(this._movieRepository);

  Future<Either<Failure, NewReleaseRespone>> getNewRelease() async {
    return _movieRepository.getNewRelease();
  }

  Future<Either<Failure, MovieRespone>> getMovies(String page) async {
    return _movieRepository.getMovies(page);
  }

  Future<Either<Failure, MovieRespone>> getSeries(String page) async {
    return _movieRepository.getSeries(page);
  }

  Future<Either<Failure, GenreRespone>> getGenre() async {
    return _movieRepository.getGenre();
  }

  Future<Either<Failure, SearchRespone>> getSearch(
      String keyword, String page) async {
    return _movieRepository.getSearch(keyword, page);
  }

  Future<Either<Failure, MovieRespone>> getByYear(
      String year, String page) async {
    return _movieRepository.getByYear(year, page);
  }

  Future<Either<Failure, YearRespone>> getYear() async {
    return _movieRepository.getYear();
  }

  Future<Either<Failure, MovieDetailRespone>> getDetailMovie(
      String slug) async {
    return _movieRepository.getDetailMovie(slug);
  }

  Future<Either<Failure, VideoRespone>> getVideo(String id) async {
    return _movieRepository.getVideo(id);
  }

  Future<Either<Failure, VideoRespone>> getSeriesVideo(String id) async {
    return _movieRepository.getSeriesVideo(id);
  }

  Future<Either<Failure, EpsDetailRespone>> getDetailEps(String slug) async {
    return _movieRepository.getDetailEps(slug);
  }

  Future<Either<Failure, MovieRespone>> getByGenre(
      String genre, String page) async {
    return _movieRepository.getByGenre(genre, page);
  }
}
