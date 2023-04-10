part of 'new_release_bloc.dart';

abstract class NewReleaseState extends Equatable {
  const NewReleaseState();

  @override
  List<Object> get props => [];
}

class NewReleaseInitial extends NewReleaseState {}

class NewReleaseWaiting extends NewReleaseState {}

class NewReleaseError extends NewReleaseState {
  final String message;

  const NewReleaseError(this.message);
}

class NewReleaseLoaded extends NewReleaseState {
  final NewReleaseRespone newRelease;

  const NewReleaseLoaded(this.newRelease);
}
