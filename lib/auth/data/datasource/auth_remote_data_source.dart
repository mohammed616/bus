import 'package:bus/auth/data/model/user_model.dart';
import 'package:bus/core/error/exceptions.dart';
import 'package:bus/core/network/api_constance.dart';
import 'package:bus/core/network/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String phone, String password);

  Future<Map<String, dynamic>> register(
    String firstName,
    String lastName,
    String mobile,
    String email,
    String password,
    String confirmPassword,
    String gender,
    String birthDate,
    String nationalIdNumber,
  );
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<Map<String, dynamic>> login(String phone, String password) async {
    FormData formData = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
    final response = await Dio().post(ApiConstance.login, data: formData);
    if (response.statusCode == 200) {
      return {"token": response.data['token']};
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Map<String, dynamic>> register(
    String firstName,
    String lastName,
    String mobile,
    String email,
    String password,
    String confirmPassword,
    String gender,
    String birthDate,
    String nationalIdNumber,
  ) async{
    FormData formData = FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'mobile':mobile,
      'email':email,
      'password':password,
      'confirmPassword':confirmPassword,
      'gender':gender,
      'birthDate':birthDate,
      'nationalIdNumber':nationalIdNumber,
    });
    final response = await Dio().post(ApiConstance.register, data: formData);
    if (response.statusCode == 200) {
      return {"token": response.data['token']};
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
