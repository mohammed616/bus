import 'package:bus/auth/presentation/controller/auth_bloc.dart';
import 'package:bus/auth/presentation/controller/auth_state.dart';
import 'package:bus/core/utils/widget/buttons.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginComponent extends StatelessWidget {
   LoginComponent({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Center(
          child:
          SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'رقم الجوال'
                  ),
                  controller: phoneController,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'كلمة المرور',
                  ),
                  controller: passwordController,
                ),
                Button1(
                  title: 'تسجيل الدخول',
                  onPressed: () async{
                    // if (_key.currentState!.validate()) {
                      context.read<AuthBloc>().add(LoginEvent(phone: phoneController.text, password: passwordController.text));
                    // }
                  },
                ),
              ],
            ),

          ),

        );
      },
    );

  }
}
