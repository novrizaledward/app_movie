part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieWaiting extends MovieState {}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);
}

class MoviesLoaded extends MovieState {
  final MovieRespone movieItem;

  const MoviesLoaded(this.movieItem);
}


