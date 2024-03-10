import 'package:flutter/material.dart';

import '../../constant/colors.dart';

abstract class AppFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w800;
}

abstract class AppFontStyles {
  static const String fontName = "Amiri";

  ///////////// Regular ////////////////////////
  static const TextStyle regularH1 = TextStyle(
      fontSize: 20,
      fontWeight: AppFontWeight.regular,
      fontFamily: fontName,
      color: text2);
  static const TextStyle regularH2 = TextStyle(
      fontSize: 18,
      fontWeight: AppFontWeight.regular,
      fontFamily: fontName,
      color: text2);
  static const TextStyle regularH3 = TextStyle(
      fontSize: 16,
      fontWeight: AppFontWeight.regular,
      fontFamily: fontName,
      color: text1);
  static const TextStyle regularH4 = TextStyle(
      fontSize: 14,
      fontWeight: AppFontWeight.regular,
      fontFamily: fontName,
      color: text1);
  static const TextStyle regularH5 = TextStyle(
      fontSize: 12,
      fontWeight: AppFontWeight.regular,
      fontFamily: fontName,
      color: text1);

  ///////////// Medium ////////////////////////

  static const TextStyle mediumH1 = TextStyle(
      fontSize: 24,
      fontWeight: AppFontWeight.medium,
      fontFamily: fontName,
      color: text2);
  static const TextStyle mediumH2 = TextStyle(
      fontSize: 18,
      fontWeight: AppFontWeight.medium,
      fontFamily: fontName,
      color: text1);

}

