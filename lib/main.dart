import 'package:flutter/material.dart';
import 'package:presta/screens/cliente/servicos.dart';
import 'package:presta/screens/login_screen.dart';
import 'package:presta/screens/prestador/AddPortifolio.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/screens/prestador/portifolio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
