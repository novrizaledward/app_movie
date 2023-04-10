part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class LoadSeries extends SeriesEvent {
  final String page;

  const LoadSeries({required this.page});
}
