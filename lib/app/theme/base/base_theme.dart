import 'package:crypto_app/app/theme/constants/theme_constants.dart';
import 'package:flutter/material.dart';

abstract class BaseTheme {
  ColorScheme get colorScheme;

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: _appBarTheme,
      cardTheme: _cardTheme,
      listTileTheme: _listTileTheme,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }

  AppBarTheme get _appBarTheme => const AppBarTheme(
        centerTitle: true,
      );

  CardTheme get _cardTheme => CardTheme(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: OutlineInputBorder(
          borderRadius: ThemeConstants.borderRadiusCircular,
          borderSide: BorderSide.none,
        ),
      );

  ListTileThemeData get _listTileTheme => const ListTileThemeData(
        contentPadding: EdgeInsets.zero,
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: ThemeConstants.borderRadiusCircular,
          borderSide: BorderSide.none,
        ),
      );
}
