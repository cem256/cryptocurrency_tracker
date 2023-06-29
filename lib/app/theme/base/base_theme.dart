import 'package:flutter/material.dart';

abstract class BaseTheme {
  ColorScheme get colorScheme;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: colorScheme,
      //TODO: Customize widgets here

      listTileTheme: _listTileTheme,
      typography: Typography.material2021(),
    );
  }

  ListTileThemeData get _listTileTheme => const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
      );
}
