
import 'package:app_movie/src/commons/exception.dart';
import 'package:app_movie/src/config/constant/endpoint.dart';
import 'package:dio/dio.dart';

import '../../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> getAuth();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  Dio get _dio => Dio(BaseOptions(
        sendTimeout: 60000,
        contentType: 'application/json',
        baseUrl: ConfigApi.baseUrl,
      ));

  @override
  Future<AuthModel> getAuth() async {
    final respone = await _dio.get(ConfigApi.auth);
    if (respone.statusCode == 200) {
      return AuthModel.fromJson(respone.data);
    } else {
      throw ServerException();
    }
  }
}
