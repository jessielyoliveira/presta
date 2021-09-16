import 'package:flutter/material.dart';

import '../estrutura.dart';

class Servicos extends StatefulWidget {
  final String? texto;
  Servicos({Key? key, required this.texto}) : super(key: key);

  @override
  _ServicosState createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  //String? nomeCidade = this.widget.texto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Você está em ${this.widget.texto}!",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.amber,
      ),

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
    //Text("Cidade: ${texto}"),
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
            /* direcionar(
                context,
                Servicos(
                    texto: this.widget.cidade,
                    categoria: this.widget.categoria));*/
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
