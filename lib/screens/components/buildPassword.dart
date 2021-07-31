import 'package:flutter/material.dart';

class BuildPassword extends StatelessWidget {
  const BuildPassword({
    Key? key,
    required TextEditingController passwordEditingController,
  })  : _passwordEditingController = passwordEditingController,
        super(key: key);

  final TextEditingController _passwordEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _passwordEditingController,
      decoration: InputDecoration(
        hintText: "Password",
      ),
    );
  }
}
