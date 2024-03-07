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
          backgroundColor: AppColor.mainRed,
          foregroundColor: AppColor.mainWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fixedSize: Size(400, 50),
        ),
      ),
      dividerColor: AppColor.mainRed,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.mainWhite,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.mainRed,
        ),
        shape: Border(bottom: BorderSide(color: AppColor.mainRed, width: 1)),
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
      scaffoldBackgroundColor: AppColor.backgroundDark,
      cardColor: AppColor.mainWhite,
      iconTheme: IconThemeData(color: AppColor.mainWhite),
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainRed,
          foregroundColor: AppColor.mainGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fixedSize: Size(350, 50),
        ),
      ),
      dividerColor: AppColor.mainWhite,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundDark,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.mainWhite,
        ),
        shape: Border(bottom: BorderSide(color: AppColor.mainWhite, width: 1)),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          color: AppColor.mainWhite,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColor.mainWhite,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColor.mainWhite,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColor.mainWhite,
        ),
        bodyLarge:
            TextStyle(fontWeight: FontWeight.w400, color: AppColor.mainWhite),
        bodyMedium:
            TextStyle(fontWeight: FontWeight.w400, color: AppColor.mainWhite),
        bodySmall:
            TextStyle(fontWeight: FontWeight.w400, color: AppColor.mainWhite),
      ),
    );
  }
}
