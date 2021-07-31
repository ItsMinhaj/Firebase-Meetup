import 'package:firebase_meetup/appLoginState/app_login_state.dart';
import 'package:firebase_meetup/firebase/app_state.dart';
import 'package:firebase_meetup/widgets/guest_book.dart';
import 'package:flutter/material.dart';
import 'package:firebase_meetup/widgets/content.dart';
import 'package:firebase_meetup/widgets/header_title.dart';
import 'package:firebase_meetup/widgets/icon_and_details.dart';
import 'package:provider/provider.dart';

enum AppLogginState {
  LoggedIn,
  LoggedOut,
  register,
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Meetup'),
      ),
      body: ListView(
        children: [
          Image.asset('assets/codelab.png'),
          IconWithDetails(icon: Icons.calendar_today, text: "Ocotober 30"),
          IconWithDetails(icon: Icons.location_city, text: "Sans Fransico"),
          Consumer<AppState>(
            builder: (context, appState, _) => AuthScreenController(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          Divider(color: Colors.grey, thickness: 1),
          HeaderTitle(text: "What we'll be doing"),
          ContentText(
              content:
                  "Join us for  day full of Firebase Workshops and pizza!Join us for  day full of Firebase Workshops and pizza!"),
          // Modify from here
          Consumer<AppState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  HeaderTitle(text: 'Discussion'),
                  GuestBook(
                    key,
                    (String message) => appState.addMessageToGuestBook(message),
                    appState.guestBookMessages,
                  ),
                ],
              ],
            ),
          ),
          // To here.
        ],
      ),
    );
  }
}
