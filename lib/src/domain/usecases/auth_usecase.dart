import 'package:app_movie/src/domain/entities/auth_entity.dart';
import 'package:app_movie/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../commons/failure.dart';

class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase(this.authRepository);

  Future<Either<Failure, AuthEntity>> execute() async {
    return authRepository.getAuth();
  }
}
