import 'package:app_movie/src/data/models/search_model.dart';
import 'package:app_movie/src/domain/usecases/movie_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieUsecase _movieUsecase;
  SearchBloc(this._movieUsecase) : super(SearchInitial()) {
    on<LoadSearch>((event, emit) async {
   
      emit(SearchWaiting());

      final result = await _movieUsecase.getSearch(event.keyword, event.page);

      result.fold(
        (l) => emit(SearchError(l.toString())),
        (r) => emit(SearchLoaded(r)),
      );
    });
  }
}
