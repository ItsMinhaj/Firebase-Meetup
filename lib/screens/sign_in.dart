import 'package:firebase_meetup/firebase/app_state.dart';
import 'package:flutter/material.dart';

import 'package:firebase_meetup/screens/components/buildEmail.dart';
import 'package:firebase_meetup/screens/components/buildPassword.dart';
import 'package:firebase_meetup/screens/components/styleButton.dart';
import 'package:firebase_meetup/widgets/header_title.dart';

class SignIn extends StatefulWidget {
  SignIn({
    Key? key,
    required this.email,
    required this.login,
  }) : super(key: key);

  final String email;
  final void Function(String email, String password) login;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _passwordEdittingController =
      TextEditingController();

  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Column(
        children: [
          HeaderTitle(text: "Sign In"),
          BuildEmail(
              textEditingController: _emailEditingController,
              hintText: "Email"),
          BuildPassword(passwordEditingController: _passwordEdittingController),
          BuildButton(
              text: "SIGN IN",
              function: () {
                widget.login(_emailEditingController.text,
                    _passwordEdittingController.text);
              }),
        ],
      ),
    );
  }
}
