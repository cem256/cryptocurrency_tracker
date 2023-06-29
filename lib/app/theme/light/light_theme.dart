import 'package:crypto_app/app/theme/base/base_theme.dart';
import 'package:flutter/material.dart';

class LightTheme extends BaseTheme {
  @override
  ColorScheme get colorScheme => _colorScheme;
  // Camarone Green
  ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006e1c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb6f2af),
      onPrimaryContainer: Color(0xff002204),
      secondary: Color(0xff52634f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd5e8cf),
      onSecondaryContainer: Color(0xff111f0f),
      tertiary: Color(0xff416277),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc6e7ff),
      onTertiaryContainer: Color(0xff001e2d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffcfdf6),
      onBackground: Color(0xff1a1c19),
      surface: Color(0xfffcfdf6),
      onSurface: Color(0xff1a1c19),
      surfaceVariant: Color(0xffdee5d8),
      onSurfaceVariant: Color(0xff424940),
      outline: Color(0xff72796f),
      outlineVariant: Color(0xffc2c9bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f312d),
      onInverseSurface: Color(0xfff0f1eb),
      inversePrimary: Color(0xff7edb7b),
      surfaceTint: Color(0xff006e1c),
    );
  }
}
