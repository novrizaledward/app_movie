import 'package:app_movie/src/data/models/eps_detail_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eps_detail_event.dart';
part 'eps_detail_state.dart';

class EpsDetailBloc extends Bloc<EpsDetailEvent, EpsDetailState> {
  final MovieUsecase _movieUsecase;
  EpsDetailBloc(this._movieUsecase) : super(EpsDetailInitial()) {
    on<LoadEpsDetail>((event, emit) async {
      emit(EpsDetailWaiting());
      final result = await _movieUsecase.getDetailEps(event.slug);

      result.fold(
        (l) => emit(EpsDetailError(l.message)),
        (r) => emit(EpsDetailLoaded(epsDetailRespone: r)),
      );
    });
  }
}
