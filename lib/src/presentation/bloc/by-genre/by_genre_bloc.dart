import 'package:app_movie/src/data/models/movie_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'by_genre_event.dart';
part 'by_genre_state.dart';

class ByGenreBloc extends Bloc<ByGenreEvent, ByGenreState> {
  final MovieUsecase _movieUsecase;
  ByGenreBloc(this._movieUsecase) : super(ByGenreInitial()) {
    on<LoadByGenre>((event, emit) async {
      emit(ByGenreWaiting());

      final result = await _movieUsecase.getByGenre(event.genre, event.page);

      result.fold(
        (l) => emit(ByGenreError(l.toString())),
        (r) => emit(ByGenreLoaded(movieRespone: r)),
      );
    });
  }
}
