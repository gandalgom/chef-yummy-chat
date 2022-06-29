import 'package:flutter/material.dart';

import 'package:yummy_chat/views/login_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginSignup(),
    );
  }
}
