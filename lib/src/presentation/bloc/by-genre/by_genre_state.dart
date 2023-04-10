part of 'by_genre_bloc.dart';

abstract class ByGenreState extends Equatable {
  const ByGenreState();

  @override
  List<Object> get props => [];
}

class ByGenreInitial extends ByGenreState {}

class ByGenreWaiting extends ByGenreState {}

class ByGenreError extends ByGenreState {
  final String message;

  const ByGenreError(this.message);
}

class ByGenreLoaded extends ByGenreState {
  final MovieRespone movieRespone;

  const ByGenreLoaded({required this.movieRespone});
}
