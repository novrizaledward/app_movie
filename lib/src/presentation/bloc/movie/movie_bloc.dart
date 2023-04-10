import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/movie_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieUsecase _movieUsecase;
  MovieBloc(this._movieUsecase) : super(MovieInitial()) {
    on<LoadMovies>((event, emit) async {
      emit(MovieWaiting());
      final result = await _movieUsecase.getMovies(event.page);

      result.fold(
          (l) => emit(
                MovieError(l.toString()),
              ), (r) {
        emit(MoviesLoaded(r));
      });
    });
  }
}
