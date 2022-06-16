import 'package:flutter/material.dart';

class ThemeConfig {
  static const double defaultPaddingAll = 10;
  static ThemeData get lightTheme {
    final theme = ThemeData.light();
    return theme.copyWith(
      //primaryColor: Colors.green,
      colorScheme: const ColorScheme.highContrastLight(),

      //scaffoldBackgroundColor: const Color(0xFFEEEEEE),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
        //titleTextStyle: TextStyle(color: theme.colorScheme.onSurface),
        backgroundColor: theme.colorScheme.onPrimary,
        titleTextStyle: TextStyle(color: theme.colorScheme.onSurface),
        elevation: 2,
      ),
      // AppBarTheme(
      //     iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      //     titleTextStyle: TextStyle(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
      //     backgroundColor: Colors.white,
      //     elevation: 2),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //backgroundColor: ColorConstants.blue800,
        //type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
        //selectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.primary,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //side: const BorderSide(color: Colors.pink)
        ),
        //shadowColor: MaterialStateProperty.all<Color>(Colors.red),
        //elevation: MaterialStateProperty.all<double>(0),
        //backgroundColor: MaterialStateProperty.all(ColorConstants.blue800),
      )),

      //textTheme: TextTheme(
      // displayLarge: TextStyle(color: theme.colorScheme.onSurface),
      // displayMedium: TextStyle(color: theme.colorScheme.onSurface),
      // displaySmall: TextStyle(color: theme.colorScheme.onSurface),
      // headlineMedium: TextStyle(color: theme.colorScheme.onSurface),
      // headlineSmall: TextStyle(color: theme.colorScheme.onSurface),
      // titleLarge: TextStyle(color: theme.colorScheme.onSurface),
      // titleMedium: TextStyle(color: theme.colorScheme.onSurface),
      // titleSmall: TextStyle(color: theme.colorScheme.onSurface),
      // bodyLarge: TextStyle(color: theme.colorScheme.onSurface),
      // bodyMedium: TextStyle(color: theme.colorScheme.onSurface),
      // bodySmall: TextStyle(color: theme.colorScheme.onSurface),
      // labelLarge: TextStyle(color: theme.colorScheme.onSurface),
      // labelSmall: TextStyle(color: theme.colorScheme.onSurface),
      //),
    );
  }

  static ThemeData get dartTheme {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: const ColorScheme.highContrastDark(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //backgroundColor: ColorConstants.blue800,
        //type: BottomNavigationBarType.fixed, //ko cho no thu nho? mat chu~
        //selectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.primary,
      ),
    );
  }
}
