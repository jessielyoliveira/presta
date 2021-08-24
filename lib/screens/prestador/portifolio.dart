import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/addServico.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/screens/prestador/verservico.dart';

class Portifolio extends StatefulWidget {
   final Prestador prestador;
  Portifolio({Key key, @required this.prestador}) : super(key: key);
  
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
            direcionar(context, PerfilPrestador(prestador: widget.prestador));
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                direcionar(context, AddServico(prestador: widget.prestador,));
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
                    direcionar(context, Servico(prestador: widget.prestador));
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
