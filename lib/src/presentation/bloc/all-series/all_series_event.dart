part of 'all_series_bloc.dart';

abstract class AllSeriesEvent extends Equatable {
  const AllSeriesEvent();

  @override
  List<Object> get props => [];
}

class LoadAllSeries extends AllSeriesEvent {
  final String page;

  const LoadAllSeries({required this.page});
}
