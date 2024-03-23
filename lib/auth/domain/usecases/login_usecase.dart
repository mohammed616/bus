import 'package:bus/auth/data/model/user_model.dart';
import 'package:bus/auth/domain/repository/base_auth_repository.dart';
import 'package:bus/core/error/failure.dart';
import 'package:bus/core/usecase/base_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUsecase extends BaseUseCase<UserModel, LoginParameters> {
  final BaseAuthRepository baseAuthRepository;

  LoginUsecase(this.baseAuthRepository);

  @override
  Future<Either<Failure,Map<String,dynamic>>> call(LoginParameters parameters) async {
    return await baseAuthRepository.login(parameters.phone, parameters.password);
  }
}

class LoginParameters extends Equatable {
  final String? phone;
  final String? password;

  const LoginParameters({
    required this.phone,
    required this.password,
  });

  @override
  List<Object> get props => [
        phone!,
        password!,
      ];
}
