import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/addServico.dart';
import 'package:presta/screens/prestador/verServico.dart';
import 'package:presta/screens/prestador/perfil.dart';

class Portifolio extends StatefulWidget {
  @override
  _PortifolioState createState() => _PortifolioState();
}

class _PortifolioState extends State<Portifolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Portifólio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            direcionar(context, PerfilPrestador());
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                direcionar(context, AddServico());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    direcionar(context, Servico());
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('chama outra tela');
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('chama outra tela');
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
