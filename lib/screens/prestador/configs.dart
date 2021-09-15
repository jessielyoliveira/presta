import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:provider/provider.dart';

class Configs extends StatefulWidget {
  final Prestador prestador;
  Configs({Key? key, required this.prestador}) : super(key: key);

  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  late bool isSwitched;

  @override
  Widget build(BuildContext context) {

    isSwitched = widget.prestador.disponivel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Configurações"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            direcionar(context, PerfilPrestador(prestador: widget.prestador));
          },
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Disponível para Serviços",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  widget.prestador.disponivel = isSwitched;

                  context.read<PrestadorRepository>().savePrestador(widget.prestador);

                });
              }),
          const Divider(
            height: 10,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton.icon(
            onPressed: () {
              // apagarConta(widget.prestador);
            },
            label: Text('Apagar Conta',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            icon: Icon(Icons.highlight_remove),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<bool> apagarConta(Prestador prestador) {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => new AlertDialog(
  //           title: new Text('Você tem certeza que deseja apagar a conta?'),
  //           content: new Text('Essa ação não poderá ser desfeita.'),
  //           actions: <Widget>[
  //             new TextButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               child: new Text('Não'),
  //             ),
  //             new TextButton(
  //               onPressed: () {
  //                 prestadoresBanco.remove(prestador);
  //                 direcionar(
  //                     context,
  //                     LoginScreen(
  //                       login: "",
  //                       senha: "",
  //                     ));
  //               },
  //               child: new Text('Sim'),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }

//   apagarContaPrestador(Prestador prestador) {
//     prestadoresBanco.remove(prestador);
//   }
// 
}