import 'package:flutter/material.dart';
import 'package:todo_list/view/components/standard_background.dart';
import 'package:todo_list/view/components/standard_button.dart';

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

class TodoItemsList extends StatefulWidget {
  const TodoItemsList({Key? key}) : super(key: key);

  @override
  State<TodoItemsList> createState() => _TodoItemsListState();
}

class _TodoItemsListState extends State<TodoItemsList> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return const Color(0xff38C24E);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Column(children: [
      const Text(
        "Tarefas (2)",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 32,
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 92,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  // const Color(0xff38C24E)
                  Checkbox(
                    shape: const CircleBorder(),
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Your favorite title',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Your favorite titleYour favorite titleYour favorite titleYour favorite titleYour favorite titleYour favorite title',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
