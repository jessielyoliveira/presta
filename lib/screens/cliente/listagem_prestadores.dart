// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:presta/model/prestador.dart';
// import 'package:presta/screens/cliente/feed.dart';
// import 'package:presta/screens/estrutura.dart';
// //import 'package:presta/screens/prestador/portifolio.dart';

// class ListagemPrestadores extends StatefulWidget {
//   @override
//   _ListagemPrestadoresState createState() => _ListagemPrestadoresState();
// }

// class _ListagemPrestadoresState extends State<ListagemPrestadores> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: getAppBar('Prestadores'),
//       body: buildListagemPrestadores(context),
//       //bottomNavigationBar: getButtonNavigationBar(),
//     );
//   }
// }

// /// Gera a listagem de prestadores
// Widget buildListagemPrestadores(BuildContext context) => Scrollbar(
//         child: ListView(
//       children: [
//         for (var prestador in prestadoresBanco)
//           itemPrestador(context, prestador)
//       ],
//     ));

// /// Gera o item com os dados do prestador na lista
// ListTile itemPrestador(BuildContext context, Prestador p) => ListTile(
//     leading: ExcludeSemantics(
//       child: CircleAvatar(
//         child: Icon(
//           Icons.person,
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.yellow.shade600,
//       ),
//     ),
//     title: Text(p.nome),
//     subtitle: Text(p.quantServicos.toString() +
//         ((p.quantServicos == 1) ? ' Serviço' : ' Serviços')),
//     onTap: () => direcionar(context, Feed()));
