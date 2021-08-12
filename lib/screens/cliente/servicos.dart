import 'package:flutter/material.dart';
import 'package:presta/screens/cliente/listagem_prestadores.dart';
import 'package:presta/screens/estrutura.dart';

class Servicos extends StatefulWidget {
  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('Selecione a Categoria do Serviço'),
        body: buildScreenCategorias(context),
        bottomNavigationBar: getButtonNavigationBar());
  }
}

/// Constrói a tela das categorias de serviço
Widget buildScreenCategorias(BuildContext context) {
  return Column(children: [
    Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            children: botoesCategorias(context)),
      ),
    ),
  ]);
}

/// Gera os botões com as categorias
List<Container> botoesCategorias(BuildContext context) {
  List<Container> botoesCategorias = [];

  for (var categoria in getCategoriasServico()) {
    var botao = Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => direcionar(context, ListagemPrestadores()),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.shade600)),
          child: Text(categoria, style: TextStyle(fontSize: 18)),
        ));

    botoesCategorias.add(botao);
  }

  return botoesCategorias;
}

/// Definição das categorias de serviços
List<String> getCategoriasServico() => [
      "Alvenaria",
      "Elétrica",
      "Hidráulica",
      "Vidraçaria",
      "Pintura",
      "Marcenaria",
    ];
