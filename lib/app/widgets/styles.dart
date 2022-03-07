import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color colorTextPrimary = const Color(0xff666666);
Color colorTextBoldPrimary = const Color(0xff333333);
Color colorTextSecond = const Color(0xff999999);
Color textLinkColor = const Color(0xff03A9F4);
Color lineBorderColor = const Color(0xffcccccc);
Color enabledColor = const Color(0xff8BC34A);
Color disabledColor = const Color(0xff707070);

Color progressSuccessColor = const Color(0xff7ED321);
Color progressErrorColor = const Color(0xffFA8B19);
Color successColor = const Color(0xff8BC34A);
Color errorColor = const Color(0xffE57373);

TextStyle titleStyle = const TextStyle(
  fontFamily: 'Roboto-Bold',
  fontSize: 31.25,
  color: Color(0xffff314f),
  fontWeight: FontWeight.w700,
  height: 1.359,
);

TextStyle textRegularMedium = TextStyle(
  fontSize: 16,
  color: colorTextPrimary,
  fontWeight: FontWeight.w500,
  height: 1.0,
);

TextStyle textTitleRegular = const TextStyle(
  fontSize: 24,
  color: Color(0xffff314f),
  fontWeight: FontWeight.w500,
  height: 1.0,
);

TextStyle textTitleRegularWhite = const TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontWeight: FontWeight.w500,
  height: 1.0,
);

TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontSize: 19,
  color: Get.isDarkMode ? Colors.white : Colors.white,
  fontWeight: FontWeight.w500,
  height: 1.26,
);
