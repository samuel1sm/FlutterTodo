import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String closeText;

  const SimpleAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.closeText = "close",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, "Close"),
            child: Text(closeText))
      ],
    );
  }
}
