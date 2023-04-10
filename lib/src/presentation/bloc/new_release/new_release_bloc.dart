import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/new_release_model.dart';
import '../../../domain/usecases/movie_usecase.dart';

part 'new_release_event.dart';
part 'new_release_state.dart';

class NewReleaseBloc extends Bloc<NewReleaseEvent, NewReleaseState> {
  final MovieUsecase _movieUsecase;
  NewReleaseBloc(this._movieUsecase) : super(NewReleaseInitial()) {
    on<LoadNewRelease>((event, emit) async {
      emit(NewReleaseWaiting());
      final result = await _movieUsecase.getNewRelease();

      result.fold(
        (l) => emit(
          NewReleaseError(l.toString()),
        ),
        (r) => emit(
          NewReleaseLoaded(r),
        ),
      );
    });
  }
}
