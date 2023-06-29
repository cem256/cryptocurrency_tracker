import 'package:flutter/material.dart';

abstract class BaseTheme {
  ColorScheme get colorScheme;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: colorScheme,
      //TODO: Customize widgets here

      appBarTheme: const AppBarTheme(),
      typography: Typography.material2021(),
    );
  }
}
