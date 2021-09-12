
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presta/database/db_firestore.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/service/autenticacao.dart';

class PrestadorRepository extends ChangeNotifier {
  // List<Moeda> _lista = [];
  late FirebaseFirestore db;
  late Autenticacao auth;

  PrestadorRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    // await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  // _readFavoritas() async {
  //   if (auth.usuario != null && _lista.isEmpty) {
  //     final snapshot =
  //         await db.collection('usuarios/${auth.usuario!.uid}/favoritas').get();

  //     snapshot.docs.forEach((doc) {
  //       Moeda moeda = MoedaRepository.tabela
  //           .firstWhere((moeda) => moeda.sigla == doc.get('sigla'));
  //       _lista.add(moeda);
  //       notifyListeners();
  //     });
  //   }
  // }

  // UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  save() {
    prestadorRef.add(
      Prestador(
        idUsuario: auth.usuario!.uid,
        nome: auth.usuario!.displayName,
        email: auth.usuario!.email,
        urlImagem: auth.usuario!.photoURL,
        contato: auth.usuario!.phoneNumber
      )
    );

    notifyListeners();
  }

  get(idUsuario) async {
    await prestadorRef.where('idUsuario', isEqualTo: auth.usuario!.uid).get().then((value) =>
      value.docs.single.data()
    );
  }

  // saveAll(List<Moeda> moedas) {
  //   moedas.forEach((moeda) async {
  //     if (!_lista.any((atual) => atual.sigla == moeda.sigla)) {
  //       _lista.add(moeda);
  //       await db
  //           .collection('usuarios/${auth.usuario!.uid}/favoritas')
  //           .doc(moeda.sigla)
  //           .set({
  //         'moeda': moeda.nome,
  //         'sigla': moeda.sigla,
  //         'preco': moeda.preco,
  //       });
  //     }
  //   });
  //   notifyListeners();
  // }

  // remove(Moeda moeda) async {
  //   await db
  //       .collection('usuarios/${auth.usuario!.uid}/favoritas')
  //       .doc(moeda.sigla)
  //       .delete();
  //   _lista.remove(moeda);
  //   notifyListeners();
  // }
}