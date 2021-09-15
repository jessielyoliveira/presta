import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/login_screen.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

class ChecaAutenticacao extends StatefulWidget {
  const ChecaAutenticacao({Key? key}) : super(key: key);

  @override
  _ChecaAutenticacaoState createState() => _ChecaAutenticacaoState();
}

class _ChecaAutenticacaoState extends State<ChecaAutenticacao> {
  @override
  Widget build(BuildContext context) {
    Autenticacao autenticacao = context.read<Autenticacao>();

    if (autenticacao.usuario == null) {
      return LoginScreen();
    } else {
      return FutureBuilder(
          future: carregaPrestadorLogado(autenticacao),
          builder: (context, snapshot) {
            Prestador? p = context.read<PrestadorRepository>().prestadorLogado;
            if (p != null) {
              return PerfilPrestador(prestador: p);
            } else {
              return loading();
            }
          });
    }
  }

  carregaPrestadorLogado(Autenticacao autenticacao) async {
    await context
        .read<PrestadorRepository>()
        .getPrestadorUsuario(autenticacao.usuario!.uid);
  }

  Widget loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
