part of 'all_movie_bloc.dart';

abstract class AllMovieState extends Equatable {
  const AllMovieState();

  @override
  List<Object> get props => [];
}

class AllMovieInitial extends AllMovieState {}

class MovieAllWaiting extends AllMovieState {}

class MovieAllError extends AllMovieState {}

class MoviesAllLoaded extends AllMovieState {
  final MovieRespone movieItem;

  const MoviesAllLoaded(this.movieItem);
}
