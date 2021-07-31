import 'package:flutter/material.dart';

import 'package:firebase_meetup/screens/components/buildEmail.dart';
import 'package:firebase_meetup/screens/components/headerTitle.dart';
import 'package:firebase_meetup/screens/components/styleButton.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        FormHeader(headerTitle: "Sign In With Email"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  BuildEmail(
                      textEditingController: _textEditingController,
                      hintText: "Enter your email"),
                  BuildButton(
                    text: "Next",
                    function: () async {
                      if (_formkey.currentState!.validate()) {
                        widget.callback(_textEditingController.text);
                      }
                    },
                  ),
                ],
              )),
        )
      ],
    );
  }
}
