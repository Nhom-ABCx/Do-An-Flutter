import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    final theme = ThemeData.light();
    return theme.copyWith(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      colorScheme: const ColorScheme.light(),
    );
  }

  static ThemeData get dartTheme {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: const ColorScheme.dark(),
    );
  }
}
