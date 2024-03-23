import 'package:bus/auth/data/datasource/auth_remote_data_source.dart';
import 'package:bus/auth/domain/repository/base_auth_repository.dart';
import 'package:bus/core/error/exceptions.dart';
import 'package:bus/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String? phone, String? password) async {


    try {
      final result = await baseAuthRemoteDataSource.login(phone, password);
      return Right(result);
    }on  DioException catch(failure){
      return Left(ServerFailure("الاتصال بالانترنت ضعيف"));
    }
    on ServerException catch (failure) {
      print('messsge: ${failure.errorMessageModel.message}');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(
    String? firstName,
    String? lastName,
    String? mobile,
    String? password,
    String? gender,
    String? birthDate,
    String? nationalIdNumber,
  ) async {

    try {

      final result = await baseAuthRemoteDataSource.register(
        firstName,
        lastName,
        mobile,
        password,
        gender,
        birthDate,
        nationalIdNumber,
      );
      return Right(result);
     }on  DioException catch(failure){
      return Left(ServerFailure("الاتصال بالانترنت ضعيف"));
    }
    on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
