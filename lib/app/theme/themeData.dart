
import 'package:beit_rent/app/constants/colorConstant.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ColorConstant.primaryColor,
    brightness: Brightness.light,
    surface: Colors.white,
  ),
  appBarTheme:const AppBarTheme(
    backgroundColor: Colors.white,
    centerTitle: false,
      surfaceTintColor: Colors.transparent
  ),
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: ColorConstant.primaryColor,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedItemColor: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: ColorConstant.primaryColor,
    )
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);