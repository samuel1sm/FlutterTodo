// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/firebase_options.dart';
import 'package:todo_list/view/screens/create_account/create_accont_screen.dart';

import '../../components/alerts/simple_alert_dialog.dart';
import '../../components/standard_background.dart';
import '../../components/standard_button.dart';
import '../../components/standard_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  final buttonKey = GlobalKey<StandardButtonState>();

  final firebaseConnection =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  void onUpdated({required String email, required String password}) {
    if (email.isNotEmpty && password.isNotEmpty) {
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
                  child: FutureBuilder(
                    future: firebaseConnection,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return buildScreen(context);
                        default:
                          return const Text("Loading");
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Welcome Back!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          controller: _emailController,
          inputType: TextInputType.emailAddress,
          hintText: 'Enter your email',
          onUpdated: (value) => onUpdated(
              email: _emailController.text, password: _passwordController.text),
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
          isPassword: true,
          controller: _passwordController,
          hintText: 'Enter password',
          onUpdated: (value) => onUpdated(
              password: _passwordController.text, email: _emailController.text),
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
            active: false,
            key: buttonKey,
            buttonText: 'Login',
            height: 60,
            width: double.infinity,
            onPressed: () async {
              var result = formKey.currentState?.validate();

              if (result ?? false) {
                final userCredential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text);

                if (!mounted) return;

                showDialog(
                    context: context,
                    builder: (context) {
                      return const SimpleAlertDialog(
                        content: 'logged deu certo',
                        title: 'loggeded in',
                      );
                    });
              }
            }),
        const SizedBox(
          height: 20,
        ),
        StandardButton(
          buttonText: 'Create Account',
          height: 60,
          width: 320,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen()));
          },
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
