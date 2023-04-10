part of 'by_year_all_bloc.dart';

abstract class ByYearAllState extends Equatable {
  const ByYearAllState();

  @override
  List<Object> get props => [];
}

class ByYearAllInitial extends ByYearAllState {}

class ByYearAllWaiting extends ByYearAllState {}

class ByYearAllError extends ByYearAllState {
  final String message;

  const ByYearAllError(this.message);
}

class ByYearLoadedAll extends ByYearAllState {
  final MovieRespone movieRespone;

  const ByYearLoadedAll(this.movieRespone);
}
