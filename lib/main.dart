import 'package:flutter/material.dart';
import 'package:presta/screens/prestador/TelaCadastro.dart';
import 'package:presta/screens/cliente/home.dart';
import 'package:presta/screens/login_screen.dart';

/*import 'package:presta/screens/cliente/listagem_prestadores.dart';
import 'package:presta/screens/cliente/servicos.dart';
import 'package:presta/screens/prestador/AddServico.dart';
import 'package:presta/screens/old/ListaAvaliacoes.dart';
import 'package:presta/screens/prestador/verServico.dart';
import 'package:presta/screens/prestador/configs.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/screens/prestador/portifolio.dart';
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
