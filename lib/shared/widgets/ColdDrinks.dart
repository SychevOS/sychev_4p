import 'package:flutter/material.dart';

class ColdDrinksScreen extends StatefulWidget {
  const ColdDrinksScreen({super.key});

  @override
  State<ColdDrinksScreen> createState() => _ColdDrinksScreenState();
}

class _ColdDrinksScreenState extends State<ColdDrinksScreen> {
  // Данные для элементов списка холодных напитков
  List<String> items = [
    'Айс Американо',
    'Кофе со льдом',
    'Фраппе',
    'Холодный чай',
    'Лимонад',
    'Морс',
    'Айс Латте',
    'Кола',
    'Сок',
    'Мохито безалкогольный'
  ];

  final TextEditingController _textEditingController = TextEditingController();

  // Функция добавления нового элемента
  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить холодный напиток'),
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
        title: const Text('Холодные напитки'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
            tooltip: 'Добавить напиток',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.ac_unit, color: Colors.blue),
              title: Text(items[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.blue,
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