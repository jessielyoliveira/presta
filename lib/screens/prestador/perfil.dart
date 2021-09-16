import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/escolherServicos.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/login_screen.dart';
import 'package:presta/screens/prestador/configs.dart';
import 'package:presta/screens/prestador/portifolio.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

class PerfilPrestador extends StatefulWidget {
  final Prestador prestador;
  PerfilPrestador({Key? key, required this.prestador}) : super(key: key);

  @override
  _PerfilPrestadorState createState() => _PerfilPrestadorState();
}

class _PerfilPrestadorState extends State<PerfilPrestador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        //title: Text("   Perfil"),
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),*/
        /*actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],*/
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24))),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          NetworkImage(widget.prestador.urlImagem!),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                Text(
                  widget.prestador.nome!,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(
                  bottom: 10,
                )),
                Padding(
                    padding: EdgeInsets.only(
                  bottom: 10,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.prestador.email!)
                    // Text('Total de Serviços Prestados: ',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //     ),
                    //     textAlign: TextAlign.center),
                    // Text(
                    //  '0',
                    //   style: TextStyle(
                    //       color: Colors.black, fontWeight: FontWeight.bold),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: IconButton(
                      icon: const Icon(Icons.photo_album),
                      //tooltip: 'Increase volume by 10',
                      onPressed: () async {
                        await context.read<PrestadorRepository>().listaServicos();
                        direcionar(
                          context,
                          Portifolio(
                            prestador: widget.prestador,
                          ),
                        );
                      },
                    ),
                  ),
                  Text('PORTIFÓLIO'),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      //tooltip: 'Increase volume by 10',
                      onPressed: () {
                        direcionar(
                            context,
                            Configs(
                              prestador: widget.prestador,
                            ));
                      },
                    ),
                  ),
                  Text('CONFIGURAÇÕES'),
                ],
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: IconButton(
                      icon: const Icon(Icons.select_all),
                      //tooltip: 'Increase volume by 10',
                      onPressed: () {
                        direcionar(
                          context,
                          EscolherServicos(prestador: widget.prestador),
                        );
                      },
                    ),
                  ),
                  Text('MEUS SERVIÇOS'),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      //tooltip: 'Increase volume by 10',
                      onPressed: () async {
                        await context.read<Autenticacao>().logout();
                        direcionar(context, LoginScreen());
                      },
                    ),
                  ),
                  Text('SAIR'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
