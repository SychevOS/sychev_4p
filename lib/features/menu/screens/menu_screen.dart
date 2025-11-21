import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/menu_table.dart';
import '../models/menu_model.dart';

class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems;
  final ValueChanged<String> onToggle;
  final ValueChanged<String> onDelete;
  final VoidCallback onAddItem;

  const MenuScreen({
    super.key,
    required this.menuItems,
    required this.onToggle,
    required this.onDelete,
    required this.onAddItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Наше меню',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: MenuTable(
              menuItems: menuItems,
              onToggle: onToggle,
              onDelete: onDelete,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddItem,
        tooltip: 'Добавить позицию',
        child: const Icon(Icons.add),
      ),
    );
  }
}