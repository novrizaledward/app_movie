import 'package:dartz/dartz.dart';

import '../../commons/failure.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> getAuth();
}
