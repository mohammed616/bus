import 'dart:ui';

import 'package:bus/constant/colors.dart';
import 'package:bus/core/utils/text_style.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Stack(
            children: [
              Container(

                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/logo.png"),
                        ],
                      ),
                     const SizedBox(
                        height: 30,
                      ),
                      const TabBar(

                        tabs: [
                          Tab(
                            child: Text(
                              'تسجيل الدخول',
                              style: AppFontStyles.regularH1,
                            ),

                          ),
                          Tab(
                            child: Text(
                              'التسجيل',
                              style: AppFontStyles.regularH1,
                            ),
                          ),
                        ],
                          indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                      color: text2,
                      ),
                ),

                      ),
                       Expanded(
                        child: TabBarView(
                          children: [
                            // واجهة الاستخدام الخاصة بتسجيل الدخول
                            Center(
                              child:
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'اسم المستخدم',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'اسم المستخدم',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'اسم المستخدم',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'اسم المستخدم',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'اسم المستخدم',
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // اتخاذ إجراء عند النقر على زر تسجيل الدخول
                                          },
                                          child: Text('تسجيل الدخول'),
                                        ),
                                      ],
                                    ),

                                  ),

                            ),
                            // واجهة الاستخدام الخاصة بالتسجيل
                            Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                      ),
                                    ),TextField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                      ),
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: 'كلمة المرور',
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // اتخاذ إجراء عند النقر على زر تسجيل الدخول
                                      },
                                      child: Text('تسجيل الدخول'),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),

                      ),
                      SizedBox(height: 16),

                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}