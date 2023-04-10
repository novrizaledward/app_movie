part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

class GenreWaiting extends GenreState {}

class GenreError extends GenreState {
  final String message;

  const GenreError(this.message);
}

class GenreLoaded extends GenreState {
  final GenreRespone genreRespone;

  const GenreLoaded(this.genreRespone);
}
