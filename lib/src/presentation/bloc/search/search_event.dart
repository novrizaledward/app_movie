part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearch extends SearchEvent {
  final String keyword;
  final String page;

  const LoadSearch({required this.keyword, required this.page});
}
