
import 'package:bus/core/network/api_constance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseAuthRemoteDataSource{
  Future<Map<String, dynamic>> login();
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource{
  @override
   Future<Map<String,dynamic>> login(String phone,String password) async{

    FormData formData = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
   final response=await Dio().post(ApiConstance.login,data: formData);
    if(response.statusCode==200){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

}