part of 'by_genre_bloc.dart';

abstract class ByGenreEvent extends Equatable {
  const ByGenreEvent();

  @override
  List<Object> get props => [];
}

class LoadByGenre extends ByGenreEvent {
  final String genre;
  final String page;

  const LoadByGenre({required this.genre, required this.page});
}
