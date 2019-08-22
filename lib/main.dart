import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        "login": (context) => LoginPage(),
        "signUp": (context) => SignUpPage(),
        "home": (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

