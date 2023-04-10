// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final MovieUsecase _movieUsecase;
  SeriesBloc(this._movieUsecase) : super(SeriesInitial()) {
    on<LoadSeries>((event, emit) async {
      emit(SeriesWaiting());

      final result = await _movieUsecase.getSeries(event.page);

      result.fold(
        (l) => emit(
          SeriesError(message: l.message),
        ),
        (r) => emit(
          SeriesLoaded(seriesRespone: r),
        ),
      );
    });
  }
}
