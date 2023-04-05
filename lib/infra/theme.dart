import 'package:flutter/material.dart';

class ThemeLight {
  ThemeData obter() {

    return ThemeData.light().copyWith(
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          primary: Color(0xFF0F5470),
        )
    );
  }
}

class ThemeDark {
  ThemeData obter() {

    return ThemeData.light().copyWith(
        textTheme: const TextTheme(),
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF212121),
          primary: Color(0xFF000000),
        )
    );

  }
}