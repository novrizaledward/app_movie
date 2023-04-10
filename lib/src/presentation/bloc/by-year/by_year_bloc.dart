import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';

part 'by_year_event.dart';
part 'by_year_state.dart';

class ByYearBloc extends Bloc<ByYearEvent, ByYearState> {
  final MovieUsecase _movieUsecase;
  ByYearBloc(this._movieUsecase) : super(ByYearInitial()) {
    on<LoadByYear>((event, emit) async {
      emit(ByYearWaiting());

      final result = await _movieUsecase.getByYear(event.year, event.page);

      result.fold(
        (l) => emit(ByYearError(l.toString())),
        (r) => emit(ByYearLoaded(r)),
      );
    });
  }
}
