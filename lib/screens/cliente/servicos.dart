import 'package:flutter/material.dart';

class Servicos extends StatefulWidget {
  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: getAppBar('Selecione a Categoria do Serviço'),
      body: buildScreenCategorias(context),
      backgroundColor: Colors.amber,
    );
    //bottomNavigationBar: getButtonNavigationBar());
  }
}

/// Constrói a tela das categorias de serviço
Widget buildScreenCategorias(BuildContext context) {
  return Column(children: [
    Padding(padding: EdgeInsets.only(top: 50)),
    Text(
      'Escolha o tipo de serviço a ser prestado',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
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
          onPressed: () {
            // direcionar(context, ListagemPrestadores());
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
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
