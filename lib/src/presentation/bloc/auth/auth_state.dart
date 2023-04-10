part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthWaiting extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthLoaded extends AuthState {
  final AuthEntity authEntity;

  AuthLoaded(this.authEntity);
}
