import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../screens/menu_screen.dart';
import '../screens/menu_form_screen.dart';

enum Screen { list, form }

class MenuContainer extends StatefulWidget {
  const MenuContainer({super.key});

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  final List<MenuItem> _menuItems = [];
  Screen _currentScreen = Screen.list;

  void _showList() {
    setState(() => _currentScreen = Screen.list);
  }

  void _showForm() {
    setState(() => _currentScreen = Screen.form);
  }

  void _addItem(String name, String category, double price) {
    setState(() {
      final newItem = MenuItem(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: name,
        category: category,
        price: price,
      );
      _menuItems.add(newItem);
      _currentScreen = Screen.list;
    });
  }

  void _toggleItem(String id) {
    setState(() {
      final index = _menuItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        final item = _menuItems[index];
        _menuItems[index] = item.copyWith(isAvailable: !item.isAvailable);
      }
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _menuItems.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.list:
        return MenuListScreen(
          menuItems: _menuItems,
          onAdd: _showForm,
          onToggle: _toggleItem,
          onDelete: _deleteItem,
        );
      case Screen.form:
        return MenuItemFormScreen(
          onSave: _addItem,
          onCancel: _showList,
        );
    }
  }
}