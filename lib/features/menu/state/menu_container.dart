import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/menu_model.dart';
import '../screens/menu_screen.dart';
import '../screens/menu_form_screen.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer({super.key});

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  final List<MenuItem> _menuItems = [
    // ГОРЯЧИЕ НАПИТКИ
    MenuItem(
      id: '1',
      name: 'Эспрессо',
      category: 'Горячие напитки',
      price: 300,
      isAvailable: true,
      imageUrl: 'https://neibors.ru/image/cache/catalog/napitki/2presso-1200x800.jpg',
    ),
    MenuItem(
      id: '2',
      name: 'Капучино',
      category: 'Горячие напитки',
      price: 400,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=1caa8d5782bbb457d3e6c5c004ce387e_l-2480510-images-thumbs&n=13',
    ),
    MenuItem(
      id: '3',
      name: 'Латте',
      category: 'Горячие напитки',
      price: 450,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=6646be7152ee17020b554bf5cca12164ace0ff31-5232579-images-thumbs&n=13',
    ),

    // ХОЛОДНЫЕ НАПИТКИ
    MenuItem(
      id: '4',
      name: 'Айс латте',
      category: 'Холодные напитки',
      price: 500,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=4fca9ac787ad648e477e904f2de8e4a871deaa10-10522468-images-thumbs&n=13',
    ),
    MenuItem(
      id: '5',
      name: 'Фраппучино',
      category: 'Холодные напитки',
      price: 550,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=526896d6d7a3501e4e1569605058bfc46cc7befd-5276739-images-thumbs&n=13',
    ),

    // ВЫПЕЧКА
    MenuItem(
      id: '6',
      name: 'Круассан',
      category: 'Выпечка',
      price: 250,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=cc7476541a12925f62a0c6d28ac08cd33ede4086-16365022-images-thumbs&n=13',
    ),
    MenuItem(
      id: '7',
      name: 'Маффин',
      category: 'Выпечка',
      price: 350,
      isAvailable: true,
      imageUrl: 'https://avatars.mds.yandex.net/i?id=613baf14258105d11599c4e210c470cd06a46219-16466062-images-thumbs&n=13',
    ),
  ];

  bool _showForm = false;

  void _showAddItemForm() {
    setState(() {
      _showForm = true;
    });
  }

  void _backToMenu() {
    setState(() {
      _showForm = false;
    });
  }

  void _addItem(String name, String category, double price, String imageUrl) {
    final newItem = MenuItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      category: category,
      price: price,
      imageUrl: imageUrl,
    );

    setState(() {
      _menuItems.add(newItem);
      _showForm = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Позиция "$name" добавлена в меню')),
    );
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
    final item = _menuItems.firstWhere((item) => item.id == id);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить позицию?'),
        content: Text('Вы уверены, что хотите удалить "${item.name}" из меню?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _menuItems.removeWhere((item) => item.id == id);
              });
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Позиция "${item.name}" удалена'),
                  action: SnackBarAction(
                    label: 'Отменить',
                    onPressed: () {
                      setState(() {
                        _menuItems.add(item);
                      });
                    },
                  ),
                ),
              );
            },
            child: const Text('Удалить', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кофейня'), // Просто текст без логотипа
      ),
      body: _showForm
          ? MenuItemFormScreen(
        onSave: _addItem,
        onCancel: _backToMenu,
      )
          : MenuScreen(
        menuItems: _menuItems,
        onToggle: _toggleItem,
        onDelete: _deleteItem,
        onAddItem: _showAddItemForm,
      ),
      floatingActionButton: _showForm
          ? null
          : FloatingActionButton(
        onPressed: _showAddItemForm,
        tooltip: 'Добавить позицию',
        child: const Icon(Icons.add),
      ),
    );
  }
}