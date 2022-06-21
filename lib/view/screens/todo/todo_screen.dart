import 'package:flutter/material.dart';
import 'package:todo_list/view/components/standard_background.dart';
import 'package:todo_list/view/components/standard_button.dart';
import 'package:todo_list/view/screens/todo/components/todo_items_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 32, bottom: 60, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TodoItemsList(),
            const SizedBox(
              height: 16,
            ),
            TodoItemsList(),
            const Spacer(),
            StandardButton(
                height: 60,
                width: double.infinity,
                buttonText: "New Task",
                onPressed: () {}),
          ],
        ),
      )
    ]);
  }
}
