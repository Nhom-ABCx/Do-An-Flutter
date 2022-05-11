import 'package:flutter/material.dart';

class ThemeConfig {
  static const double defaultPaddingAll = 10;
  static ThemeData get lightTheme {
    final theme = ThemeData.light();
    return theme.copyWith(
      //primaryColor: Colors.green,
      colorScheme: const ColorScheme.light(),

      //scaffoldBackgroundColor: const Color(0xFFEEEEEE),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
          titleTextStyle: TextStyle(color: theme.colorScheme.onSurface),
          backgroundColor: Colors.white,
          elevation: 2),
      // AppBarTheme(
      //     iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      //     titleTextStyle: TextStyle(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
      //     backgroundColor: Colors.white,
      //     elevation: 2),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //backgroundColor: ColorConstants.blue800,
        type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
        //selectedIconTheme: const IconThemeData(size: 30),
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.white,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //side: const BorderSide(color: Colors.pink)
        )),
        //shadowColor: MaterialStateProperty.all<Color>(Colors.red),
        //elevation: MaterialStateProperty.all<double>(0),
        //backgroundColor: MaterialStateProperty.all(ColorConstants.blue800),
      )),
    );
  }

  static ThemeData get dartTheme {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: const ColorScheme.dark(),
    );
  }
}
