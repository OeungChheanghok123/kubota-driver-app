import 'package:driver_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebAppTextStyle {
  static TextStyle headline1 = TextStyle(
    color: blackColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline2 = const TextStyle(
    color: secondColor,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title1 = TextStyle(
    color: blackColor,
    fontSize: 14.sp,
  );

  static TextStyle title2 = TextStyle(
    color: blackColor,
    fontSize: 13.sp,
  );

  static TextStyle body = const TextStyle(
    color: blackColor,
    fontSize: 13,
  );
}
