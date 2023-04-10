import 'package:app_movie/src/data/models/year_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'year_event.dart';
part 'year_state.dart';

class YearBloc extends Bloc<YearEvent, YearState> {
  final MovieUsecase _movieUsecase;
  YearBloc(this._movieUsecase) : super(YearInitial()) {
    on<LoadYear>((event, emit) async {
      emit(YearWaiting());

      final result = await _movieUsecase.getYear();

      result.fold(
        (l) => emit(YearError(l.toString())),
        (r) => emit(YearLoaded(r)),
      );
    });
  }
}
