import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    final theme = ThemeData.light();
    return theme.copyWith(
      //primaryColor: Colors.green,
      colorScheme: const ColorScheme.light(),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //backgroundColor: ColorConstants.blue800,
        type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
        //selectedIconTheme: const IconThemeData(size: 30),
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.white,
      ),
    );
  }

  static ThemeData get dartTheme {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: const ColorScheme.dark(),
    );
  }
}
