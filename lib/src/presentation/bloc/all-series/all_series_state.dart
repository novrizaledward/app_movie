part of 'all_series_bloc.dart';

abstract class AllSeriesState extends Equatable {
  const AllSeriesState();

  @override
  List<Object> get props => [];
}

class AllSeriesInitial extends AllSeriesState {}

class AllSeriesWaiting extends AllSeriesState {}

class AllSeriesError extends AllSeriesState {}

class AllSeriesLoaded extends AllSeriesState {
  final MovieRespone seriesRespone;

  const AllSeriesLoaded(this.seriesRespone);
}
