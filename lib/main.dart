import 'package:flutter/material.dart';
import 'package:presta/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Presta',
        home: LoginScreen()
        );
  }
}