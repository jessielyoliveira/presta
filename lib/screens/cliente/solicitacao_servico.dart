import 'package:flutter/material.dart';

class SolicitacaoServicos extends StatefulWidget {
  final String title = 'Presta App';
  @override
  _SolicitacaoServicosState createState() => _SolicitacaoServicosState();
}

class _SolicitacaoServicosState extends State<SolicitacaoServicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade600,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.all(20),
        children: buttonsCategorias(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getButtonsNavigationBar(),
      ),
    );
  }
}

/// Gera os botões com as categorias */
List<TextButton> buttonsCategorias() {
  List<TextButton> buttonsCategorias = [];

  for (var categoria in getCategoriasServico()) {
    var button = TextButton(
      child: Text(
        categoria,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
      ),
      onPressed: () {},
    );

    buttonsCategorias.add(button);
  }

  return buttonsCategorias;
}

/// Definição das categorias de serviços */
List<String> getCategoriasServico() => [
      "Alvenaria",
      "Elétrica",
      "Hidráulica",
      "Vidraçaria",
      "Pintura",
      "Marcenaria"
    ];

/// Botões da barra de navegação */
List<BottomNavigationBarItem> getButtonsNavigationBar() => [
      BottomNavigationBarItem(
          label: 'Serviços', icon: Icon(Icons.construction)),
      BottomNavigationBarItem(
          label: 'Solicitações', icon: Icon(Icons.pending_actions)),
      BottomNavigationBarItem(label: 'Sair', icon: Icon(Icons.logout)),
    ];
