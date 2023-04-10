import 'package:app_movie/src/commons/exception.dart';
import 'package:app_movie/src/commons/failure.dart'; 
import 'package:app_movie/src/domain/entities/auth_entity.dart';
import 'package:app_movie/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../sources/remote/auth_remote_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, AuthEntity>> getAuth() async {
    try {
      final result = await authDataSource.getAuth();

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("Something went wrong !"));
    } catch (e) {
      return const Left(ServerFailure('Server Not Respone !'));
    }
  }
}
