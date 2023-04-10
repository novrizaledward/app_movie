part of 'by_year_all_bloc.dart';

abstract class ByYearAllEvent extends Equatable {
  const ByYearAllEvent();

  @override
  List<Object> get props => [];
}

class LoadByYearAll extends ByYearAllEvent {
  final String year;
  final String page;

  const LoadByYearAll(this.year, this.page);
}
