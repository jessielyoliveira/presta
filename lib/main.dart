import 'package:flutter/material.dart';
import 'package:presta/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Presta',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen() //Home(title: 'Presta'),
        );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
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
        style: TextStyle(fontSize: 22.0),
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
