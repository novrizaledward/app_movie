part of 'all_movie_bloc.dart';

abstract class AllMovieEvent extends Equatable {
  const AllMovieEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMovies extends AllMovieEvent {
  final String page;

  const LoadAllMovies({required this.page});
}
