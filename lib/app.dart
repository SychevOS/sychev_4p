import 'package:flutter/material.dart';
import 'shared/theme/app_theme.dart';
import 'features/menu/state/menu_container.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофейня',
      theme: AppTheme.lightTheme,
      home: const MenuContainer(),
    );
  }
}