import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_meetup/screens/components/styleButton.dart';
import 'package:firebase_meetup/screens/email_form.dart';
import 'package:firebase_meetup/screens/registration_form.dart';
import 'package:firebase_meetup/screens/sign_in.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class AuthScreenController extends StatelessWidget {
  const AuthScreenController({
    Key? key,
    required this.loginState,
    required this.startLoginFlow,
    required this.email,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  }) : super(key: key);

  final ApplicationLoginState loginState;
  final void Function() startLoginFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final String? email;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BuildButton(
                  text: "RSVP",
                  function: () {
                    startLoginFlow();
                  }),
            ),
          ],
        );

      case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));

      case ApplicationLoginState.password:
        return SignIn(
            email: email!,
            login: (email, password) {
              signInWithEmailAndPassword(email, password,
                  (e) => _showErrorDialog(context, 'Failed to sign in', e));
            });
      case ApplicationLoginState.register:
        return RegistrationForm(
            email: email!,
            registerAccount: (email, displayName, password) {
              registerAccount(
                  email,
                  displayName,
                  password,
                  (e) =>
                      _showErrorDialog(context, 'Failed to create account', e));
            },
            cancel: () {
              cancelRegistration();
            });
      case ApplicationLoginState.loggedIn:
        return Padding(
          padding: EdgeInsets.only(right: 7),
          child: BuildButton(
              text: "LOGOUT",
              function: () {
                signOut();
              }),
        );

      default:
        return Text("Interner error, tihs shouldn't happen...");
    }
  }

  _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            BuildButton(
              text: "ok",
              function: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
} // AuthScreenController
