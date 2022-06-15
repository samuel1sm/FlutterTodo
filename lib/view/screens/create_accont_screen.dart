// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/firebase_options.dart';

import '../components/alerts/simple_alert_dialog.dart';
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
  final firebaseConnection =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
                  child: FutureBuilder(
                    future: firebaseConnection,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return buildScreen();
                        default:
                          return const Text("active");
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

  Column buildScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Welcome Onboard!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          inputType: TextInputType.name,
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
            inputType: TextInputType.emailAddress,
            hintText: 'Enter your email',
            onUpdated: (String? value) => onUpdated(email: value),
            validator: (String? value) =>
                (value?.isNotEmpty ?? false) ? null : "Email Invalido"),
        const SizedBox(
          height: 20,
        ),
        StandardTextField(
            isPassword: true,
            hintText: 'Enter password',
            onUpdated: (String? value) => onUpdated(password: value),
            validator: (String? value) =>
                ((value?.length ?? 0) > 2) ? null : "Senha Invalida"),
        const SizedBox(
          height: 20,
        ),
        StandardTextField(
          isPassword: true,
          hintText: 'Confirm password',
          onUpdated: (String? value) => onUpdated(confirmPassword: value),
          validator: (String? value) =>
              (password == confirmPassword && (password?.isNotEmpty ?? false))
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
          onPressed: () async {
            var result = formKey.currentState?.validate();

            if (result ?? false) {
              try {
                final userCredentials = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email!, password: password!);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'email-already-in-use') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SimpleAlertDialog(
                          content: 'E-mail já existente',
                          title: 'Failure on Account Creation',
                        );
                      });
                }
              } catch (e) {
                print(e);
              }
            }
          },
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
