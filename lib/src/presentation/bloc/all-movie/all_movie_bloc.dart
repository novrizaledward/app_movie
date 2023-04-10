import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/movie_usecase.dart';

part 'all_movie_event.dart';
part 'all_movie_state.dart';

class AllMovieBloc extends Bloc<AllMovieEvent, AllMovieState> {
  final MovieUsecase _movieUsecase;
  AllMovieBloc(this._movieUsecase) : super(AllMovieInitial()) {
    on<LoadAllMovies>((event, emit) async {
      emit(MovieAllWaiting());
      final result = await _movieUsecase.getMovies(event.page);

      result.fold(
        (l) => emit(MovieAllError()),
        (r) => emit(MoviesAllLoaded(r)),
      );
    });
  }
}
