import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_list/view/screens/create_account/create_accont_screen.dart';
import 'package:todo_list/view/screens/login/login_screen.dart';
import 'package:todo_list/view/screens/splash/splash_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: "todo list",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const SplashScreen(),
    builder: EasyLoading.init(),
  ));
}
