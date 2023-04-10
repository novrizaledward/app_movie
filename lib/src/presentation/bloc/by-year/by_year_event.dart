part of 'by_year_bloc.dart';

abstract class ByYearEvent extends Equatable {
  const ByYearEvent();

  @override
  List<Object> get props => [];
}

class LoadByYear extends ByYearEvent {
  final String year;
  final String page;

  const LoadByYear(this.year, this.page);
}

