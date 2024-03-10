import 'package:bus/auth/data/datasource/auth_remote_data_source.dart';
import 'package:bus/auth/domain/repository/base_auth_repository.dart';
import 'package:bus/core/error/exceptions.dart';
import 'package:bus/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String phone, String password) async {
    final result = await baseAuthRemoteDataSource.login(phone, password);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(
    String firstName,
    String lastName,
    String mobile,
    String email,
    String password,
    String confirmPassword,
    String gender,
    String birthDate,
    String nationalIdNumber,
  ) async {
    final result = await baseAuthRemoteDataSource.register(
      firstName,
      lastName,
      mobile,
      email,
      password,
      confirmPassword,
      gender,
      birthDate,
      nationalIdNumber,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
