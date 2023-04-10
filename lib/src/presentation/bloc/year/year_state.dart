part of 'year_bloc.dart';

abstract class YearState extends Equatable {
  const YearState();

  @override
  List<Object> get props => [];
}

class YearInitial extends YearState {}

class YearWaiting extends YearState {}

class YearError extends YearState {
  final String message;

  const YearError(this.message);
}

class YearLoaded extends YearState {
  final YearRespone yearRespone;

  const YearLoaded(this.yearRespone);
}
