// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../components/standard_background.dart';
import '../components/standard_button.dart';
import '../components/standard_textField.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String? name;

  String? email;

  String? password;

  String? confirmPassword;

  final formKey = GlobalKey<FormState>();

  final buttonKey = GlobalKey<StandardButtonState>();

  void onUpdated(
      {String? name,
      String? email,
      String? password,
      String? confirmPassword}) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirmPassword = confirmPassword ?? this.confirmPassword;

    if (this.name != null &&
        this.email != null &&
        this.password != null &&
        this.confirmPassword != null) {
      buttonKey.currentState?.onChange(true);
    } else {
      buttonKey.currentState?.onChange(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Onboard!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Let’s help you meet up your task",
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      StandardTextField(
                        hintText: 'Enter your full name',
                        onUpdated: (String? value) => onUpdated(name: value),
                        validator: (String? value) {
                          if ((value?.length ?? 0) < 2) {
                            return "Nome Incompleta";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StandardTextField(
                          hintText: 'Enter your email',
                          onUpdated: (String? value) => onUpdated(email: value),
                          validator: (String? value) =>
                              (value?.isNotEmpty ?? false)
                                  ? null
                                  : "Email Invalido"),
                      const SizedBox(
                        height: 20,
                      ),
                      StandardTextField(
                          hintText: 'Enter password',
                          onUpdated: (String? value) =>
                              onUpdated(password: value),
                          validator: (String? value) =>
                              ((value?.length ?? 0) > 2)
                                  ? null
                                  : "Senha Invalida"),
                      const SizedBox(
                        height: 20,
                      ),
                      StandardTextField(
                        hintText: 'Confirm password',
                        onUpdated: (String? value) =>
                            onUpdated(confirmPassword: value),
                        validator: (String? value) =>
                            (password == confirmPassword &&
                                    (password?.isNotEmpty ?? false))
                                ? null
                                : "Senha diferente da Anterior",
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      StandardButton(
                        key: buttonKey,
                        buttonText: 'Register',
                        height: 60,
                        width: double.infinity,
                        active: false,
                        onPressed: () {
                          var result = formKey.currentState?.validate();
                          if (result ?? false) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
