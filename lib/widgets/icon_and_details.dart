import 'package:flutter/material.dart';

class IconWithDetails extends StatelessWidget {
  const IconWithDetails({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 8),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8,
          ),
          Text(text)
        ],
      ),
    );
  }
}
