import 'package:flutter/material.dart';

class DessertsScreen extends StatefulWidget {
  const DessertsScreen({super.key});

  @override
  State<DessertsScreen> createState() => _DessertsScreenState();
}

class _DessertsScreenState extends State<DessertsScreen> {
  // Данные для элементов списка десертов
  List<String> items = [
    'Тирамису',
    'Чизкейк',
    'Брауни',
    'Маффин',
    'Круассан',
    'Эклер',
    'Пончик',
    'Печенье',
    'Мороженое',
    'Панна котта'
  ];

  final TextEditingController _textEditingController = TextEditingController();

  // Функция добавления нового элемента
  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить десерт'),
          content: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: "Введите название десерта"),
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
        title: const Text('Десерты'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
            tooltip: 'Добавить десерт',
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 0.5,
        ),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.cake, color: Colors.pink),
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
        backgroundColor: Colors.pink,
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