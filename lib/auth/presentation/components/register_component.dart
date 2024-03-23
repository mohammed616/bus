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
import 'package:intl/intl.dart';

class RegisterComponent extends StatefulWidget {
  RegisterComponent({Key? key}) : super(key: key);

  @override
  _RegisterComponentState createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController personalIdController = TextEditingController();
  String? selectedGender;
  String? selectedDate;
  String? formattedDate;


  String? errorMessage;
  String? errorMessage1;
  String? errorMessage2;
  String? errorMessage3;

  void showError(String message, String message1,String message2,String message3) {
    setState(() {
      errorMessage = message;
      errorMessage1 = message1;
      errorMessage2=message2;
      errorMessage3=message3;
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
      errorMessage2=null;
      errorMessage3=null;
    });
  }

  bool _obscureText = true;
  bool _obscureText1 = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;


    });
  }
  void _togglePasswordVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;


    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState.AuthState>(
        builder: (context, state) {
          print(selectedDate);
          print(formattedDate);
          void _showToast(BuildContext context) async{

            await Fluttertoast.showToast(
              msg: state.registerMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,);

          }
          if(state.registerState==RequestState.error){
            _showToast(context);
          }
          print(state.registerMessage);
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'انضم الينا واختر وجهتك في الوقت المناسب للانطلاق وبأفضل الأسعار مع أفضل شركات للنقل ',
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
                        children:[
                          TextFormField(
                            maxLength: 15,
                            decoration: InputDecoration(
                              hintText: ' الاسم الأول',
                              border: OutlineInputBorder(),
                              errorStyle:
                              TextStyle(fontSize: 14, color: Colors.red),
                              focusedErrorBorder:
                              _customInputBorder(Colors.red),
                              enabledBorder: _customInputBorder(Colors.grey),
                              focusedBorder: _customInputBorder(text2),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                            controller: firstNameController,
                            validator: (value) {
                              return Validator.validateInput(
                                value,
                                requireNotEmpty: true,
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 15,
                            decoration: InputDecoration(
                              hintText: ' الاسم الثاني',
                              border: OutlineInputBorder(),
                              errorStyle:
                              TextStyle(fontSize: 14, color: Colors.red),
                              focusedErrorBorder:
                              _customInputBorder(Colors.red),
                              enabledBorder: _customInputBorder(Colors.grey),
                              focusedBorder: _customInputBorder(text2),
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                            controller: lastNameController,
                            validator: (value) {
                              return Validator.validateInput(
                                value,
                                requireNotEmpty: true,
                              );
                            },
                          ),
                          SizedBox(height: 10),
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
                                showError(validationMessage, '','','');
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
                            obscureText: _obscureText1,
                            onChanged: (value) {
                              String? validationMessage1 =
                              Validator.validateInput(
                                value,
                                requireAtLastDigits: true,
                              );
                              if (validationMessage1 != null) {
                                showError('', validationMessage1,'','');
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
                                  _obscureText1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: _togglePasswordVisibility1,
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
                          TextFormField(
                            maxLength: 15,
                            obscureText: _obscureText,
                            onChanged: (value) {
                              String? validationMessage2 =
                              Validator.validateInput(
                                value,
                                requireAtLastDigits: true,
                              );
                              if (validationMessage2 != null) {
                                showError('', '',validationMessage2,'');
                              } else {
                                clearError();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: ' أعد ادخال كلمة المرور  ',
                              border: OutlineInputBorder(),
                              errorText: errorMessage2,
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
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'كلمتي المرور غير متطابقتين';
                              }
                              return Validator.validateInput(
                                value,
                                requireNotEmpty: true,
                                requireAtLastDigits: true,
                              );

                            },
                          ),
                          SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: selectedGender,
                            decoration: InputDecoration(
                              hintText: 'اختر الجنس',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'male',
                                child: Text('ذكر'),
                              ),
                              DropdownMenuItem(
                                value: 'female',
                                child: Text('أنثى'),
                              ),
                            ],
                            validator:(value){
                              return Validator.validateInput(
                                value,
                                requireNotEmpty: true,
                              );
                            } ,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                           const Text('تاريخ الميلاد',style: TextStyle(color: Colors.black),),
                            IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    selectedDate = pickedDate.toString();
                                    DateTime dateTime = DateTime.parse(selectedDate!);

                                     formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                                  });
                                }
                              }, icon:const Icon(Icons.date_range,color: text2,),
                            ),
                            if (formattedDate != null) Text(
                              formattedDate!,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),

                          SizedBox(height: 10,),
                          TextFormField(
                            maxLength: 11,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              String? validationMessage3 =
                              Validator.validateInput(
                                value,
                                  requireelevenDigits:true,
                              );
                              if (validationMessage3 != null) {
                                showError('', '','',validationMessage3);
                              } else {
                                clearError();
                              }
                            },
                            decoration: InputDecoration(
                              hintText: ' الرقم الوطني ',
                              border: OutlineInputBorder(),
                              errorText: errorMessage3,
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
                            controller: personalIdController,
                            validator: (value) {
                              return Validator.validateInput(
                                value,
                                requireelevenDigits: true,
                                requireNotEmpty: true,
                              );
                            },
                          ),
                          if (state.registerState == RequestState.loading)
                            Center(child: CircularProgressIndicator())
                          else
                            Button1(
                              title: ' التسجيل',
                              style: TextStyle(color: Colors.white),
                              onPressed: () async{
                                if(formattedDate!=null){
                                if (_key.currentState!.validate()) {
                                  print('validation');
                                  print(selectedGender);

                                  context.read<AuthBloc>().add(RegisterEvent(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    mobile: phoneController.text,
                                    password: passwordController.text,
                                    confirmPassword: confirmPasswordController.text,
                                    gender: selectedGender,
                                    birthDate: formattedDate,
                                    nationalIdNumber: personalIdController.text,
                                  ),
                                  );

                                  }
                                }
                                else{
                                  Fluttertoast.showToast(
                                    msg: "يرجى اختيار تاريخ الميلاد",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                  );
                                }


                                }
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
