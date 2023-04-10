import 'package:app_movie/src/data/repositories/ads_repository_impl.dart';
import 'package:app_movie/src/data/repositories/movie_repository_impl.dart';
import 'package:app_movie/src/data/repositories/auth_repository_impl.dart';
import 'package:app_movie/src/data/sources/ads/applovin.dart';
import 'package:app_movie/src/domain/repositories/ads_repository.dart';
import 'package:app_movie/src/domain/repositories/auth_repository.dart';
import 'package:app_movie/src/domain/repositories/movie_repository.dart';
import 'package:app_movie/src/domain/usecases/ads_usecase.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:app_movie/src/presentation/bloc/all-series/all_series_bloc.dart';
import 'package:app_movie/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:app_movie/src/presentation/bloc/by-genre/by_genre_bloc.dart';
import 'package:app_movie/src/presentation/bloc/by-year/by_year_bloc.dart';
import 'package:app_movie/src/presentation/bloc/eps-detail/eps_detail_bloc.dart';
import 'package:app_movie/src/presentation/bloc/genre/genre_bloc.dart';
import 'package:app_movie/src/presentation/bloc/movie-detail/movie_detail_bloc.dart';
import 'package:app_movie/src/presentation/bloc/series/series_bloc.dart';
import 'package:app_movie/src/presentation/bloc/video/video_bloc.dart';
import 'package:app_movie/src/presentation/bloc/year/year_bloc.dart';
import 'package:get_it/get_it.dart';

import 'src/data/sources/ads/admob.dart';
import 'src/data/sources/remote/auth_remote_source.dart';
import 'src/data/sources/remote/movie_remote_source.dart';
import 'src/domain/usecases/auth_usecase.dart';
import 'src/presentation/bloc/all-movie/all_movie_bloc.dart';
import 'src/presentation/bloc/ads/ads_bloc.dart';
import 'src/presentation/bloc/by-year-all/by_year_all_bloc.dart';
import 'src/presentation/bloc/movie/movie_bloc.dart';
import 'src/presentation/bloc/new_release/new_release_bloc.dart';
import 'src/presentation/bloc/search/search_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => AuthBloc(locator()));
  locator.registerFactory(() => NewReleaseBloc(locator()));
  locator.registerFactory(() => MovieBloc(locator()));
  locator.registerFactory(() => SeriesBloc(locator()));
  locator.registerFactory(() => AllMovieBloc(locator()));
  locator.registerFactory(() => AllSeriesBloc(locator()));
  locator.registerFactory(() => GenreBloc(locator()));
  locator.registerFactory(() => SearchBloc(locator()));
  locator.registerFactory(() => ByYearBloc(locator()));
  locator.registerFactory(() => YearBloc(locator()));
  locator.registerFactory(() => MovieDetailBloc(locator()));
  locator.registerFactory(() => AdsBloc(locator()));
  locator.registerFactory(() => VideoBloc(locator()));
  locator.registerFactory(() => EpsDetailBloc(locator()));
  locator.registerFactory(() => ByYearAllBloc(locator()));
  locator.registerFactory(() => ByGenreBloc(locator()));

  // usecases
  locator.registerLazySingleton(() => AuthUsecase(locator()));
  locator.registerLazySingleton(() => MovieUsecase(locator()));
  locator.registerLazySingleton(() => AdsUsecase(locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: locator()),
  );
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(movieRemoteDataSource: locator()),
  );
  locator.registerLazySingleton<AdsRepository>(
    () => AdsRepositoryImpl(admobSource: locator(), applovinSource: locator()),
  );

  // sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<AdmobSource>(
    () => AdmobSourceImpl(),
  );
  locator.registerLazySingleton<ApplovinSource>(
    () => ApplovinSourceImpl(),
  );
}
