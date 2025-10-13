import 'package:flutter/material.dart';

class HotDrinksScreen extends StatefulWidget {
  const HotDrinksScreen({super.key});

  @override
  State<HotDrinksScreen> createState() => _HotDrinksScreenState();
}

class _HotDrinksScreenState extends State<HotDrinksScreen> {
  // Данные для элементов списка
  List<String> items = [
    'Эспрессо', 'Американо', 'Капучино', 'Латте',
    'Флэт Уайт', 'Раф', 'Моккачино', 'Горячий шоколад',
    'Черный чай', 'Зелёный чай', 'Травяной чай', 'Макиато',
    'Кортадо', 'Айриш кофе'
  ];

  final TextEditingController _textEditingController = TextEditingController();

  // Функция добавления нового элемента
  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить напиток'),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: "Введите название напитка"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_textEditingController.text.isNotEmpty) {
                    items.add(_textEditingController.text);
                    _textEditingController.clear();
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );
  }

  // Функция удаления элемента
  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Горячие напитки'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
            tooltip: 'Добавить напиток',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: items.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                        tooltip: 'Удалить напиток',
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}