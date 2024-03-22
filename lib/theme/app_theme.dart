import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColor.mainRed,
      scaffoldBackgroundColor: AppColor.backgroundLight,
      iconTheme: IconThemeData(color: AppColor.mainRed),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainRed,
          foregroundColor: AppColor.textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      dividerColor: AppColor.mainRed,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundLight,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.mainRed,
        ),
        shape: Border(bottom: BorderSide(color: AppColor.mainRed, width: 1)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.backgroundLight,
        selectedItemColor: AppColor.mainRed,
        selectedIconTheme: IconThemeData(color: AppColor.mainRed),
        selectedLabelStyle: TextStyle(color: AppColor.mainRed),
        unselectedItemColor: AppColor.textLight,
        unselectedIconTheme: IconThemeData(color: AppColor.textLight),
        unselectedLabelStyle: TextStyle(color: AppColor.textLight),
      ),
      textTheme: Typography.blackMountainView,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.mainRed,
            ),
            borderRadius: BorderRadius.circular(12.0)),
      ),
      dialogBackgroundColor: AppColor.backgroundLight,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColor.mainRed,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      iconTheme: IconThemeData(color: AppColor.textDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainRed,
          foregroundColor: AppColor.textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      dividerColor: AppColor.textDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.backgroundDark,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.textDark,
        ),
        shape: Border(bottom: BorderSide(color: AppColor.textDark, width: 1)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.backgroundDark,
        selectedItemColor: AppColor.mainRed,
        selectedIconTheme: IconThemeData(color: AppColor.mainRed),
        selectedLabelStyle: TextStyle(color: AppColor.mainRed),
        unselectedItemColor: AppColor.textDark,
        unselectedIconTheme: IconThemeData(color: AppColor.textDark),
        unselectedLabelStyle: TextStyle(color: AppColor.textDark),
      ),
      textTheme: Typography.whiteMountainView,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.mainRed,
            ),
            borderRadius: BorderRadius.circular(12.0)),
      ),
      dialogBackgroundColor: AppColor.backgroundDark,
    );
  }
}
