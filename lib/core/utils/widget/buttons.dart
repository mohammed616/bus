import 'package:bus/constant/colors.dart';
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  Button1(
      {this.mainColor = text2,
      this.title = '',
      this.isLoading = false,
      this.onPressed,
      this.style,
      Key? key})
      : super(key: key);

  Function()? onPressed;
  String title;
  Color mainColor;
  bool isLoading;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: text2,
          shadowColor: Colors.transparent,
          foregroundColor: const Color(0xff232323),
          elevation: 0,
          disabledBackgroundColor: text1,
          animationDuration: const Duration(milliseconds: 250),
          minimumSize: Size(double.infinity, getHeight * 0.045),
          maximumSize: Size(double.infinity, getHeight * 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(title,
            textAlign: TextAlign.center, style: style),
      ),
    );
  }
}
