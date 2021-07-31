import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
    );
  }
}
