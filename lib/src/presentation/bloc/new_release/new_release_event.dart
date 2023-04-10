part of 'new_release_bloc.dart';

abstract class NewReleaseEvent extends Equatable {
  const NewReleaseEvent();

  @override
  List<Object> get props => [];
}

class LoadNewRelease extends NewReleaseEvent {}
