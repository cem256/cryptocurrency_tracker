import 'package:crypto_app/app/theme/base/base_theme.dart';
import 'package:flutter/material.dart';

final class LightTheme extends BaseTheme {
  @override
  ColorScheme get colorScheme => _colorScheme;
  // Camarone Green
  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006e1c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6f2af),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff36855e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc0ffd8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff00658c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc5e7ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff000000),
      background: Color(0xfff8fbf8),
      onBackground: Color(0xff000000),
      surface: Color(0xfff8fbf8),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe0e6e2),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff737373),
      outlineVariant: Color(0xffbfbfbf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff101311),
      onInverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xff8edfa3),
      surfaceTint: Color(0xff006e1c),
    );
  }
}
