import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class MenuItemTile extends StatelessWidget {
  final MenuItem item;
  final ValueChanged<String> onToggle;
  final ValueChanged<String> onDelete;

  const MenuItemTile({
    super.key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: item.isAvailable,
        onChanged: (bool? value) => onToggle(item.id),
      ),
      title: Text(item.name),
      subtitle: Text('${item.price} руб. • ${item.category}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onDelete(item.id),
      ),
    );
  }
}