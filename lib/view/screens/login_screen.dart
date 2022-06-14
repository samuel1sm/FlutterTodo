// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list/view/screens/create_accont_screen.dart';

import '../components/standard_background.dart';
import '../components/standard_button.dart';
import '../components/standard_textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Back!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      "assets/images/login_image.png",
                      height: 200,
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    StandardTextField(
                      hintText: 'Enter your email',
                      validator: (String? value) {
                        if (value?.isNotEmpty ?? false) {
                          return null;
                        }
                        return "Email Invalido";
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StandardTextField(
                      hintText: 'Enter password',
                      validator: (String? value) {
                        if ((value?.length ?? 0) < 2) {
                          return "Senha Incompleta";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    StandardButton(
                      buttonText: 'Login',
                      height: 60,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StandardButton(
                      buttonText: 'Create Account',
                      height: 60,
                      width: double.infinity,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAccountScreen()));
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
        ],
      ),
    );
  }
}
