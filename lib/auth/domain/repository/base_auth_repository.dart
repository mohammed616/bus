

import 'package:bus/auth/data/model/user_model.dart';

import 'package:bus/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository{

  Future<Either<Failure,UserModel>> login(String phone,String password);

}