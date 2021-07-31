import 'package:firebase_meetup/constant/contstant.dart';
import 'package:firebase_meetup/firebase/app_state.dart';
import 'package:firebase_meetup/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    builder: (context, _) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: kPrimaryColor,
          accentColor: Colors.black),
      darkTheme: ThemeData.dark(),
      home: Home(),
    );
  }
}
