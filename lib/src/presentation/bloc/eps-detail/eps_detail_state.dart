part of 'eps_detail_bloc.dart';

abstract class EpsDetailState extends Equatable {
  const EpsDetailState();

  @override
  List<Object> get props => [];
}

class EpsDetailInitial extends EpsDetailState {}

class EpsDetailWaiting extends EpsDetailState {}

class EpsDetailError extends EpsDetailState {
  final String message;

  const EpsDetailError(this.message);
}

class EpsDetailLoaded extends EpsDetailState {
  final EpsDetailRespone? epsDetailRespone;

  const EpsDetailLoaded({this.epsDetailRespone});
}
