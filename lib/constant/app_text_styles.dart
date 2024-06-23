import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyle {
  //Text Sized
  //Kiểu cũ nunito
  static TextStyle headerTitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return GoogleFonts.roboto(
      fontSize: 38,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle subTitleTitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle h0TitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w800,
  }) {
    return GoogleFonts.roboto(
      fontSize: 30,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle h1TitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle h2TitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.roboto(
        fontSize: 22, fontWeight: fontWeight, color: color);
  }

  static TextStyle h3TitleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.roboto(
      fontSize: 18,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle h4TitleTextStyle({
    Color? color = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.roboto(
        fontSize: 15, fontWeight: fontWeight, color: color);
  }

  static TextStyle h5TitleTextStyle(
      {Color? color = Colors.black, FontWeight fontWeight = FontWeight.w400}) {
    return GoogleFonts.roboto(
        fontSize: 13, fontWeight: fontWeight, color: color);
  }

  static TextStyle h6TitleTextStyle(
      {Color? color = Colors.black, FontWeight fontWeight = FontWeight.w300}) {
    return GoogleFonts.roboto(
        fontSize: 11, fontWeight: fontWeight, color: color);
  }

  static TextStyle hintStyle() {
    return AppTextStyle.h5TitleTextStyle(
      // color: AppColor.cancelledColor,
      fontWeight: FontWeight.w600,
    );
  }
}
