// import 'package:app_movie/src/data/models/series_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';

part 'all_series_event.dart';
part 'all_series_state.dart';

class AllSeriesBloc extends Bloc<AllSeriesEvent, AllSeriesState> {
  final MovieUsecase _movieUsecase;
  AllSeriesBloc(this._movieUsecase) : super(AllSeriesInitial()) {
    on<LoadAllSeries>((event, emit) async {
      emit(AllSeriesWaiting());
      final result = await _movieUsecase.getSeries(event.page);

      result.fold(
        (l) => emit(AllSeriesError()),
        (r) => emit(AllSeriesLoaded(r)),
      );
    });
  }
}
