import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.brown,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      useMaterial3: true,
    );
  }
}