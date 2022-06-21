import 'package:flutter/material.dart';
import 'package:todo_list/view/screens/todo/components/todo_item.dart';

class TodoItemsList extends StatefulWidget {
  const TodoItemsList({Key? key}) : super(key: key);

  @override
  State<TodoItemsList> createState() => _TodoItemsListState();
}

class _TodoItemsListState extends State<TodoItemsList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Tarefas (2)",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 20,
      ),
      SingleChildScrollView(
        child: Column(
          children: [TodoItem()],
        ),
      ),
    ]);
  }
}
