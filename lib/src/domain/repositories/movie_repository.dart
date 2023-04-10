import 'package:app_movie/src/commons/failure.dart'; 
import 'package:app_movie/src/data/models/eps_detail_model.dart';
import 'package:app_movie/src/data/models/genre_model.dart';
import 'package:app_movie/src/data/models/movie_detail_model.dart';
import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/data/models/search_model.dart';
// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/data/models/video_model.dart';
import 'package:app_movie/src/data/models/year_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/new_release_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, NewReleaseRespone>> getNewRelease();
  Future<Either<Failure, MovieRespone>> getMovies(String page);
  Future<Either<Failure, MovieRespone>> getSeries(String page);
  Future<Either<Failure, GenreRespone>> getGenre();
  Future<Either<Failure, MovieRespone>> getByGenre(String genre, String page);
  Future<Either<Failure, SearchRespone>> getSearch(String keyword, String page);
  Future<Either<Failure, YearRespone>> getYear();
  Future<Either<Failure, MovieRespone>> getByYear(String year, String page);
  Future<Either<Failure, MovieDetailRespone>> getDetailMovie(String slug);
  Future<Either<Failure, VideoRespone>> getVideo(String id);
  Future<Either<Failure, VideoRespone>> getSeriesVideo(String id);
  Future<Either<Failure, EpsDetailRespone>> getDetailEps(String slug);
}
