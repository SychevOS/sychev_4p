import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[200],
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: _url,
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
      title: Text(item.name),
      subtitle: Text('${item.price} руб. · ${item.category}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              item.isAvailable ? Icons.check_circle : Icons.remove_circle,
              color: item.isAvailable ? Colors.green : Colors.red,
            ),
            onPressed: () => onToggle(item.id),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onDelete(item.id),
          ),
        ],
      ),
    );
  }
}