import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.mainRed,
      scaffoldBackgroundColor: AppColor.mainWhite,
      cardColor: AppColor.mainGray,
      iconTheme: IconThemeData(color: AppColor.mainRed),
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.mainRed,
          onPrimary: AppColor.mainWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fixedSize: Size(400, 50),
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 26,
          color: AppColor.mainRed,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColor.mainRed,
        ),
        bodySmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.mainRed),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColor.mainRed,
      scaffoldBackgroundColor: AppColor.mainGray,
      cardColor: AppColor.mainWhite,
      iconTheme: IconThemeData(color: AppColor.mainRed),
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.mainRed,
          onPrimary: AppColor.mainGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fixedSize: Size(350, 50),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 18,
          color: AppColor.mainRed,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColor.mainRed,
        ),
        bodyText1: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: AppColor.mainRed),
      ),
    );
  }
}
