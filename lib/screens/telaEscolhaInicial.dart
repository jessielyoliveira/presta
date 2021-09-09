import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presta/screens/cliente/home.dart';
import 'package:presta/screens/login_screen.dart';

import 'estrutura.dart';

class EscolhaInicial extends StatefulWidget {
  @override
  _EscolhaInicialState createState() => _EscolhaInicialState();
}

class _EscolhaInicialState extends State<EscolhaInicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("PRESTA APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          Padding(padding: EdgeInsets.only(bottom: 45)),
          ElevatedButton.icon(
            onPressed: () {
              direcionar(context, Home());
            },
            label: Text('ACESSO USUÁRIO'),
            icon: Icon(Icons.person),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              direcionar(context, LoginScreen());
            },
            label: Text('ACESSO PRESTADOR'),
            icon: Icon(Icons.handyman_sharp),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 45)),
          ElevatedButton.icon(
            onPressed: () {
              SystemNavigator.pop();
            },
            label: Text('SAIR'),
            icon: Icon(Icons.exit_to_app),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
