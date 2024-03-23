import 'package:bus/auth/data/model/user_model.dart';
import 'package:bus/core/error/exceptions.dart';
import 'package:bus/core/network/api_constance.dart';
import 'package:bus/core/network/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String? phone, String? password);

  Future<Map<String, dynamic>> register(
    String? firstName,
    String? lastName,
    String? mobile,
    String? password,
    String? gender,
    String? birthDate,
    String? nationalIdNumber,
  );
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<Map<String, dynamic>> login(String? phone, String? password) async {
    FormData formData = FormData.fromMap({
      'phoneNumber': phone,
      'password': password,
    });
    final response = await Dio().post(ApiConstance.login, data: formData);
    print(formData);
    print(response.data);
    if (response.data['state']==1) {
      return response.data;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Map<String, dynamic>> register(
    String? firstName,
    String? lastName,
    String? mobile,
    String? password,
    String? gender,
    String? birthDate,
    String? nationalIdNumber,
  ) async{
    print("gender$gender");
    FormData formData = FormData.fromMap({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber':mobile,
      'password':password,
      'gendor':gender,
      'birthDay':birthDate,
      'personalId':nationalIdNumber,
    });
    formData.fields.forEach((field) {
      print('${field.key}: ${field.value}');
    });
    final response = await Dio().post(ApiConstance.register, data: formData);
    print(response.data);
    if (response.data['state']==1) {
      return response.data;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
