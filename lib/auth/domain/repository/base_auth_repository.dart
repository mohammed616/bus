import 'package:bus/auth/data/model/user_model.dart';

import 'package:bus/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String? phone, String? password);

  Future<Either<Failure, Map<String, dynamic>>> register(
      String? firstName,
      String? lastName,
      String? mobile,
      String? password,
      String? gender,
      String? birthDate,
      String? nationalIdNumber,
  );
}
