import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/menu_table.dart';

class MenuListScreen extends StatelessWidget {
  final List<MenuItem> menuItems;
  final void Function() onAdd;
  final void Function(String id) onToggle;
  final void Function(String id) onDelete;

  const MenuListScreen({
    required this.menuItems,
    required this.onAdd,
    required this.onToggle,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Меню кофейни')),
      body: MenuTable(
        menuItems: menuItems,
        onToggle: onToggle,
        onDelete: onDelete,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}