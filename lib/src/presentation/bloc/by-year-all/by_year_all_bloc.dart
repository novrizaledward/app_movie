import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/movie_model.dart';
import '../../../domain/usecases/movie_usecase.dart';

part 'by_year_all_event.dart';
part 'by_year_all_state.dart';

class ByYearAllBloc extends Bloc<ByYearAllEvent, ByYearAllState> {
  final MovieUsecase _movieUsecase;
  ByYearAllBloc(this._movieUsecase) : super(ByYearAllInitial()) {
    on<LoadByYearAll>((event, emit) async {
      emit(ByYearAllWaiting());

      final result = await _movieUsecase.getByYear(event.year, event.page);

      result.fold(
        (l) => emit(ByYearAllError(l.toString())),
        (r) => emit(ByYearLoadedAll(r)),
      );
    });
  }
}
