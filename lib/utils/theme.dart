import 'package:flutter/material.dart';

class TomyTimerTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff8f4951),
    surfaceTint: Color(0xff8f4951),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffffdadb),
    onPrimaryContainer: Color(0xff3b0712),
    secondary: Color(0xff2c638b),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffcce5ff),
    onSecondaryContainer: Color(0xff001d31),
    tertiary: Color(0xff6a5f11),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xfff4e389),
    onTertiaryContainer: Color(0xff201c00),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfff4fbf9),
    onSurface: Color(0xff161d1c),
    onSurfaceVariant: Color(0xff524344),
    outline: Color(0xff857374),
    outlineVariant: Color(0xffd7c1c2),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2b3231),
    inversePrimary: Color(0xffffb2b9),
    primaryFixed: Color(0xffffdadb),
    onPrimaryFixed: Color(0xff3b0712),
    primaryFixedDim: Color(0xffffb2b9),
    onPrimaryFixedVariant: Color(0xff72333b),
    secondaryFixed: Color(0xffcce5ff),
    onSecondaryFixed: Color(0xff001d31),
    secondaryFixedDim: Color(0xff99ccf9),
    onSecondaryFixedVariant: Color(0xff074b72),
    tertiaryFixed: Color(0xfff4e389),
    onTertiaryFixed: Color(0xff201c00),
    tertiaryFixedDim: Color(0xffd7c770),
    onTertiaryFixedVariant: Color(0xff514700),
    surfaceDim: Color(0xffd5dbda),
    surfaceBright: Color(0xfff4fbf9),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xffeff5f4),
    surfaceContainer: Color(0xffe9efee),
    surfaceContainerHigh: Color(0xffe3e9e8),
    surfaceContainerHighest: Color(0xffdde4e3),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffffb8be),
    surfaceTint: Color(0xffffb2b9),
    onPrimary: Color(0xff34030d),
    primaryContainer: Color(0xffca7a82),
    onPrimaryContainer: Color(0xff000000),
    secondary: Color(0xff9dd0fe),
    onSecondary: Color(0xff001829),
    secondaryContainer: Color(0xff6396c1),
    onSecondaryContainer: Color(0xff000000),
    tertiary: Color(0xffdccc74),
    onTertiary: Color(0xff1b1600),
    tertiaryContainer: Color(0xff9f9140),
    onTertiaryContainer: Color(0xff000000),
    error: Color(0xffffbab1),
    onError: Color(0xff370001),
    errorContainer: Color(0xffff5449),
    onErrorContainer: Color(0xff000000),
    surface: Color(0xff0e1514),
    onSurface: Color(0xfff6fcfb),
    onSurfaceVariant: Color(0xffdbc6c6),
    outline: Color(0xffb29e9f),
    outlineVariant: Color(0xff917f80),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdde4e3),
    inversePrimary: Color(0xff74343c),
    primaryFixed: Color(0xffffdadb),
    onPrimaryFixed: Color(0xff2c0008),
    primaryFixedDim: Color(0xffffb2b9),
    onPrimaryFixedVariant: Color(0xff5d222b),
    secondaryFixed: Color(0xffcce5ff),
    onSecondaryFixed: Color(0xff001321),
    secondaryFixedDim: Color(0xff99ccf9),
    onSecondaryFixedVariant: Color(0xff00395a),
    tertiaryFixed: Color(0xfff4e389),
    onTertiaryFixed: Color(0xff151100),
    tertiaryFixedDim: Color(0xffd7c770),
    onTertiaryFixedVariant: Color(0xff3e3600),
    surfaceDim: Color(0xff0e1514),
    surfaceBright: Color(0xff343a3a),
    surfaceContainerLowest: Color(0xff090f0f),
    surfaceContainerLow: Color(0xff161d1c),
    surfaceContainer: Color(0xff1a2120),
    surfaceContainerHigh: Color(0xff252b2b),
    surfaceContainerHighest: Color(0xff2f3636),
  );

  static const cardTheme = CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ));

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: lightColorScheme,
      cardTheme: cardTheme.copyWith(
        surfaceTintColor: lightColorScheme.surfaceTint,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(lightColorScheme.primary),
          foregroundColor: WidgetStatePropertyAll(lightColorScheme.onPrimary),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.secondary,
        foregroundColor: lightColorScheme.onSecondary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: darkColorScheme,
      cardTheme: cardTheme.copyWith(
        surfaceTintColor: darkColorScheme.surfaceTint,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(lightColorScheme.primary),
          foregroundColor: WidgetStatePropertyAll(lightColorScheme.onPrimary),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.secondary,
        foregroundColor: lightColorScheme.onSecondary,
      ),
    );
  }
}
