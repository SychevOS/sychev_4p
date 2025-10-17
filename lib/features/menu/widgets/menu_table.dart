import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import 'menu_item_tile.dart';

class MenuTable extends StatelessWidget {
  final List<MenuItem> menuItems;
  final ValueChanged<String> onToggle;
  final ValueChanged<String> onDelete;

  const MenuTable({
    super.key,
    required this.menuItems,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (menuItems.isEmpty) {
      return const Center(
        child: Text(
          'Меню пусто',
          style: TextStyle(fontSize: 16, color: Colors.pink),
        ),
      );
    }

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return MenuItemTile(
          key: ValueKey(item.id),
          item: item,
          onToggle: onToggle,
          onDelete: onDelete,
        );
      },
    );
  }
}