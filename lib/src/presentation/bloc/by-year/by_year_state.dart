part of 'by_year_bloc.dart';

abstract class ByYearState extends Equatable {
  const ByYearState();

  @override
  List<Object> get props => [];
}

class ByYearInitial extends ByYearState {}

class ByYearWaiting extends ByYearState {}

class ByYearError extends ByYearState {
  final String message;

  const ByYearError(this.message);
}

class ByYearLoaded extends ByYearState {
  final MovieRespone movieRespone;

  const ByYearLoaded(this.movieRespone);
}

