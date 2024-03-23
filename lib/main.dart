import 'package:bus/auth/presentation/screens/auth_screen.dart';
import 'package:bus/core/services/services_locator.dart';
import 'package:bus/core/utils/app_localizations.dart';
import 'package:bus/core/utils/text_style.dart';
import 'package:bus/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constant/colors.dart';



void main() {

  ServiceLocator().init();
  runApp(

       const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizationsDelegate(),

      ],
      supportedLocales: [
        const Locale('ar'),
        const Locale('en'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Amiri',
        textTheme:const TextTheme(
          bodyText1: AppFontStyles.mediumH1,
          bodyText2: AppFontStyles.mediumH1,

        ),
        primaryColor: text2,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        ),
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
    );
  }
}

