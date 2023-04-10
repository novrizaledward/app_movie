import 'package:app_movie/src/data/models/genre_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final MovieUsecase _movieUsecase;
  GenreBloc(this._movieUsecase) : super(GenreInitial()) {
    on<LoadGenre>((event, emit) async {
      emit(GenreWaiting());
      final result = await _movieUsecase.getGenre();

      result.fold(
        (l) => emit(GenreError(l.message)),
        (r) => emit(GenreLoaded(r)),
      );
    });
  }
}
