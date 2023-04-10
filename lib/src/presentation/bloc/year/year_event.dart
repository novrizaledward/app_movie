part of 'year_bloc.dart';

abstract class YearEvent extends Equatable {
  const YearEvent();

  @override
  List<Object> get props => [];
}

class LoadYear extends YearEvent {}
