import 'package:flutter/material.dart';

class BuildEmail extends StatelessWidget {
  const BuildEmail(
      {Key? key,
      required TextEditingController textEditingController,
      required this.hintText})
      : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your email address to continue';
        }
        return null;
      },
    );
  }
}
