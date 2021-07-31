import 'package:firebase_meetup/firebase/app_state.dart';
import 'package:firebase_meetup/screens/components/buildEmail.dart';
import 'package:firebase_meetup/screens/components/buildPassword.dart';
import 'package:firebase_meetup/screens/components/styleButton.dart';
import 'package:firebase_meetup/widgets/header_title.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm(
      {Key? key,
      required this.email,
      required this.registerAccount,
      required this.cancel})
      : super(key: key);
  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function() cancel;
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  AppState appState = AppState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          HeaderTitle(text: "Create account"),
          BuildEmail(
              textEditingController: _textEditingController,
              hintText: "Enter a valid email"),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _nameEditingController,
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          BuildPassword(passwordEditingController: _passwordEditingController),
          ButtonBar(
            children: [
              TextButton(
                  onPressed: () {
                    appState.cancelRegistration();
                  },
                  child: Text("Cancel")),
              BuildButton(
                text: "Save",
                function: () {
                  widget.registerAccount(
                    _textEditingController.text,
                    _nameEditingController.text,
                    _passwordEditingController.text,
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
