import 'package:flutter/material.dart';
import 'package:presta/screens/login_screen.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

class ChecaAutenticacao extends StatefulWidget {
  const ChecaAutenticacao({ Key? key }) : super(key: key);

  @override
  _ChecaAutenticacaoState createState() => _ChecaAutenticacaoState();
}

class _ChecaAutenticacaoState extends State<ChecaAutenticacao> {
  @override
  Widget build(BuildContext context) {

    Autenticacao autenticacao = Provider.of<Autenticacao>(context);

    if (autenticacao.isLoading) {
      return loading();
    } else if (autenticacao.usuario == null) {
      return LoginScreen();
    } else {
      return homne();
    }
  }

  Widget loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


  Widget homne() {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await context.read<Autenticacao>().logout();
          }, 
          child: Text('saiu'))
      ),
    );
  }
}