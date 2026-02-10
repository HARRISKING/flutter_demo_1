import 'package:flutter/material.dart';
import 'package:flutter_demo_1/pages/components/todo_item.dart';
import 'package:flutter_demo_1/pages/components/add_dialog.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _todoItems = [
    ['今日任务', false],
  ];

  void changeStatus(int index) {
    setState(() {
      _todoItems[index][1] = !_todoItems[index][1];
    });
  }

  void addTask(String task) {
    setState(() {
      _todoItems.add([task, false]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView.builder(
          itemCount: _todoItems.length,
          itemBuilder: (context, index) => TodoItem(
            content: _todoItems[index][0],
            status: _todoItems[index][1],
            onChanged: (value) => changeStatus(index),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddDialog(onAddTask: addTask),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
