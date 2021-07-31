import 'dart:async'; // new

import 'package:flutter/material.dart';

import 'package:firebase_meetup/firebase/app_state.dart';
import 'package:firebase_meetup/screens/components/styleButton.dart';
import 'package:firebase_meetup/widgets/paragraph.dart';

class GuestBook extends StatefulWidget {
  GuestBook(
    Key? key,
    this.addMessage,
    this.messages,
  ) : super(key: key);
  final Future<void> Function(String message) addMessage;
  final List<GuestBookMessage> messages;

  @override
  _GuestBookState createState() => _GuestBookState();
}

class _GuestBookState extends State<GuestBook> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_GuestBookState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Leave a message',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your message to continue';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 8),
                BuildButton(
                  text: "SEND",
                  function: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.addMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        // Modify from here
        SizedBox(height: 8),
        for (var message in widget.messages)
          Paragraph('${message.name}: ${message.message}'),
        SizedBox(height: 8),
        // to here.
      ],
    );
  }
}
