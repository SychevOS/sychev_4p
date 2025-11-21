import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // КЕШИРОВАННОЕ ИЗОБРАЖЕНИЕ ПРОДУКТА
            CachedNetworkImage(
              imageUrl: item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) =>
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
              errorWidget: (context, url, error) => Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getCategoryIcon(item.category),
                  color: Colors.brown,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item.price.toStringAsFixed(2)} ₽', // ЗАМЕНА НА РУБЛИ
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Switch(
                  value: item.isAvailable,
                  onChanged: (value) => onToggle(item.id),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onDelete(item.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Горячие напитки':
        return Icons.coffee;
      case 'Холодные напитки':
        return Icons.ac_unit;
      case 'Выпечка':
        return Icons.bakery_dining;
      default:
        return Icons.restaurant_menu;
    }
  }
}