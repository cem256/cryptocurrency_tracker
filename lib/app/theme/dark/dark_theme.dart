import 'package:crypto_app/app/theme/base/base_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme extends BaseTheme {
  @override
  ColorScheme get colorScheme => _colorScheme;
  // Camarone Green
  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff7edb7b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff005313),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffa3f4c5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff003822),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff87cffb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff004c6a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff000000),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xff161b16),
      onBackground: Color(0xffffffff),
      surface: Color(0xff161b16),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff394339),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xff8c8c8c),
      outlineVariant: Color(0xff404040),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff8fdf8),
      onInverseSurface: Color(0xff000000),
      inversePrimary: Color(0xff446d43),
      surfaceTint: Color(0xff7edb7b),
    );
  }
}
