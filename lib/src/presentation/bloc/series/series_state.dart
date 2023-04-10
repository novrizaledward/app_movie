part of 'series_bloc.dart';

abstract class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

class SeriesInitial extends SeriesState {}

class SeriesWaiting extends SeriesState {}

class SeriesError extends SeriesState {
  final String message;

  const SeriesError({required this.message});
}

class SeriesLoaded extends SeriesState {
  final MovieRespone seriesRespone;

  const SeriesLoaded({required this.seriesRespone});
}
