import 'package:bus/auth/presentation/controller/auth_bloc.dart';
import 'package:bus/auth/presentation/controller/auth_state.dart' as AuthState;
import 'package:bus/constant/colors.dart';
import 'package:bus/core/utils/enums.dart';
import 'package:bus/core/utils/validation.dart';
import 'package:bus/core/utils/widget/buttons.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginComponent extends StatefulWidget {
  LoginComponent({Key? key}) : super(key: key);

  @override
  _LoginComponentState createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? errorMessage;
  String? errorMessage1;
  bool showErrorToast = false;

  void showError(String message, String message1) {
    setState(() {
      errorMessage = message;
      errorMessage1 = message1;
    });
  }

  OutlineInputBorder _customInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 2.0),
    );
  }

  void clearError() {
    setState(() {
      errorMessage = null;
      errorMessage1 = null;
    });
  }

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState.AuthState>(
        builder: (context, state) {

          void _showToast(BuildContext context) async{
            print('object ${state.loginMessage}');

           await Fluttertoast.showToast(
                msg: state.loginMessage,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,);

          }
          if(state.loginState==RequestState.error){
            _showToast(context);
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'أهلاً بعودتك ،حان الوقت لحجز مقعد لرحلتك وبدء رحلة جديدة مع بولمان ',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              String? validationMessage =
                                  Validator.validateInput(
                                value,
                                requireStartsWith09: true,
                                requireTenDigits: true,
                              );
                              if (validationMessage != null) {
                                showError(validationMessage, '');
                              } else {
                                clearError();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: ' رقم الجوال',
                              border: OutlineInputBorder(),
                              errorText: errorMessage,
                              errorStyle:
                                  TextStyle(fontSize: 14, color: Colors.red),
                              focusedErrorBorder:
                                  _customInputBorder(Colors.red),
                              enabledBorder: _customInputBorder(Colors.grey),
                              focusedBorder: _customInputBorder(text2),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              suffixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.grey,
                              ),
                            ),
                            controller: phoneController,
                            validator: (value) {
                              return Validator.validateInput(
                                value,
                                requireStartsWith09: true,
                                requireTenDigits: true,
                                requireNotEmpty: true,
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 15,
                            obscureText: _obscureText,
                            onChanged: (value) {
                              String? validationMessage1 =
                                  Validator.validateInput(
                                value,
                                requireAtLastDigits: true,
                              );
                              if (validationMessage1 != null) {
                                showError('', validationMessage1);
                              } else {
                                clearError();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: ' كلمة المرور ',
                              border: OutlineInputBorder(),
                              errorText: errorMessage1,
                              errorStyle:
                                  TextStyle(fontSize: 14, color: Colors.red),
                              focusedErrorBorder:
                                  _customInputBorder(Colors.red),
                              enabledBorder: _customInputBorder(Colors.grey),
                              focusedBorder: _customInputBorder(text2),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              return Validator.validateInput(
                                value,
                                requireNotEmpty: true,
                                requireAtLastDigits: true,
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          if (state.loginState == RequestState.loading)
                            Center(child: CircularProgressIndicator())
                          else
                            Button1(
                              title: 'تسجيل الدخول ',
                              style: TextStyle(color: Colors.white),
                              onPressed: () async{
                                if (_key.currentState!.validate()) {

                                  print('validation');
                                  print(RequestState);

                                  context.read<AuthBloc>().add(LoginEvent(
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                      )
                                  );


                                  context.read<AuthBloc>().add(ClearLoginMessageEvent());
                                }
                              },
                            ),


                          SizedBox(height: 20),
                          Text(
                            '2024 | by CodexTech Team  ',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
