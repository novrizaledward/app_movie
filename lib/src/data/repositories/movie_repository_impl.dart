import 'dart:developer';
import 'package:app_movie/src/commons/failure.dart';
import 'package:app_movie/src/data/models/eps_detail_model.dart';
import 'package:app_movie/src/data/models/genre_model.dart';
import 'package:app_movie/src/data/models/movie_detail_model.dart';
import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/data/models/search_model.dart';
// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/data/models/video_model.dart';
import 'package:app_movie/src/data/models/year_model.dart';
import 'package:app_movie/src/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../../commons/exception.dart';
import '../models/new_release_model.dart';
import '../sources/remote/movie_remote_source.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Failure, NewReleaseRespone>> getNewRelease() async {
    try {
      final result = await movieRemoteDataSource.getNewRelease();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, MovieRespone>> getMovies(String page) async {
    try {
      final result = await movieRemoteDataSource.getMovies(page);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, MovieRespone>> getSeries(String page) async {
    try {
      final result = await movieRemoteDataSource.getSeries(page);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, GenreRespone>> getGenre() async {
    try {
      final result = await movieRemoteDataSource.getGenre();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, SearchRespone>> getSearch(
      String keyword, String page) async {
    try {
      final result = await movieRemoteDataSource.getSearch(keyword, page);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, MovieRespone>> getByYear(
      String year, String page) async {
    try {
      final result = await movieRemoteDataSource.getByYear(year, page);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, YearRespone>> getYear() async {
    try {
      final result = await movieRemoteDataSource.getYear();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, MovieDetailRespone>> getDetailMovie(
      String slug) async {
    try {
      final result = await movieRemoteDataSource.getMovieDetail(slug);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, VideoRespone>> getVideo(String id) async {
    try {
      final result = await movieRemoteDataSource.getVideo(id);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, EpsDetailRespone>> getDetailEps(String slug) async {
    try {
      final result = await movieRemoteDataSource.getEpsDetail(slug);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, VideoRespone>> getSeriesVideo(String id) async {
    try {
      final result = await movieRemoteDataSource.getSeriesVideo(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      log(e.toString());
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }

  @override
  Future<Either<Failure, MovieRespone>> getByGenre(
    String genre,
    String page,
  ) async {
    try {
      final result = await movieRemoteDataSource.getByGenre(genre, page);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }
}
