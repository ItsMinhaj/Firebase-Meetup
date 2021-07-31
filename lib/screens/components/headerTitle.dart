import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.headerTitle,
  }) : super(key: key);

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      headerTitle,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    );
  }
}
