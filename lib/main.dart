import 'package:flutter/material.dart';
import 'package:todo_list/view/screens/create_accont_screen.dart';
import 'package:todo_list/view/screens/login_screen.dart';
import 'package:todo_list/view/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: "todo list",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const SplashScreen(),
  ));
}
