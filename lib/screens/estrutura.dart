import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

/// Título do App
String getTitleApp() => 'Presta';

/// Gera a AppBar
AppBar getAppBar(titulo) =>
    AppBar(title: Text(titulo), backgroundColor: Colors.yellow.shade600);

/// Gera o BottomNavigationBar
BottomNavigationBar getButtonNavigationBar() => BottomNavigationBar(
      items: botoesNavegacao(),
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow.shade600,
      type: BottomNavigationBarType.fixed,
    );

/// Gera os botões da barra de navegação
List<BottomNavigationBarItem> botoesNavegacao() => [
      BottomNavigationBarItem(
          icon: Icon(Icons.construction), label: 'Serviços'),
      BottomNavigationBarItem(
          icon: Icon(Icons.assessment), label: 'Avaliações'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair'),
    ];

/// Direciona para a tela passada por parâmetro
void direcionar(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void direcionarPosLogin(BuildContext context, Prestador prestadorLogado) {
  // Inicializa o Prestador Repository com o usuário autenticado.
  PrestadorRepository(auth: context.read<Autenticacao>());

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => PerfilPrestador(prestador: prestadorLogado)));
}
