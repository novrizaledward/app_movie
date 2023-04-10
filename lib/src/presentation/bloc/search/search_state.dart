part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchWaiting extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);
}

class SearchLoaded extends SearchState {
  final SearchRespone searchRespone;

  const SearchLoaded(this.searchRespone);
}
