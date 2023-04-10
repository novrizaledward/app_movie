 

import 'package:app_movie/src/data/models/movie_detail_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieUsecase _movieUsecase;
  MovieDetailBloc(this._movieUsecase) : super(MovieDetailInitial()) {
    on<LoadMovieDetail>((event, emit) async {
      emit(MovieDetailWaiting());

      final result = await _movieUsecase.getDetailMovie(event.slug);

      result.fold(
        (l) => emit(MovieDetailError(l.message)),
        (r) => emit(MovieDetailLoaded(r)),
      );
    });
  }
}
