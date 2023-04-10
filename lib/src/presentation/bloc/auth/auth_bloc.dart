import 'package:app_movie/src/domain/entities/auth_entity.dart';
import 'package:app_movie/src/domain/usecases/auth_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUsecase;
  AuthBloc(this._authUsecase) : super(AuthInitial()) {
    on<LoadAuth>((event, emit) async {
      emit(AuthWaiting());
      final result = await _authUsecase.execute();

      result.fold(
        (l) => emit(
          AuthError(l.toString()),
        ),
        (r) => emit(
          AuthLoaded(r),
        ),
      );
    });
  }
}
