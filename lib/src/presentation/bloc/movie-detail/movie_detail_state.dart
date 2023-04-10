part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailWaiting extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailRespone movieDetailRespone;

  const MovieDetailLoaded(this.movieDetailRespone);

}
