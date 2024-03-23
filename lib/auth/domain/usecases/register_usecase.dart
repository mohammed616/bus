import 'package:bus/auth/data/model/user_model.dart';
import 'package:bus/auth/domain/repository/base_auth_repository.dart';
import 'package:bus/core/error/failure.dart';
import 'package:bus/core/usecase/base_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUseCase extends BaseUseCase<UserModel, RegisterParameters> {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
      RegisterParameters parameters) async {
    return await baseAuthRepository.register(
      parameters.firstName,
      parameters.lastName,
      parameters.mobile,
      parameters.password,
      parameters.gender,
      parameters.birthDate,
      parameters.nationalIdNumber,
    );
  }
}

class RegisterParameters extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? password;
  final String? gender;
  final String? birthDate;
  final String? nationalIdNumber;

  const RegisterParameters({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.gender,
    required this.birthDate,
    required this.mobile,
    required this.nationalIdNumber,
  });

  @override
  List<Object> get props => [
        firstName!,
        lastName!,
        mobile!,
        password!,
        gender!,
        birthDate!,
        nationalIdNumber!,
      ];
}
