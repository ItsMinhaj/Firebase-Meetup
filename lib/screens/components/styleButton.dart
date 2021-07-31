import 'package:flutter/material.dart';

import 'package:firebase_meetup/constant/contstant.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: OutlinedButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: kPrimaryColor, width: 1),
        ),
      ),
      alignment: Alignment.centerRight,
    );
  }
}
