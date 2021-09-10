
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/telaEscolhaInicial.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
   runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Autenticacao()),
        ChangeNotifierProvider(create: (context) => PrestadorRepository(
          auth: context.read<Autenticacao>())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EscolhaInicial());
  }
}
