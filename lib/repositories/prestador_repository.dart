import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presta/database/db_firestore.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/model/servico.dart';
import 'package:presta/service/autenticacao.dart';

class PrestadorRepository extends ChangeNotifier {
  List<Servico> _lista = [];
  late FirebaseFirestore db;
  late Autenticacao auth;
  Prestador? prestadorLogado;

  PrestadorRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await listaServicos();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  // Atualiza a lista de serviços
  listaServicos() async {
    _lista = [];
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot = await db
          .collection('prestadores/${auth.usuario!.uid}/servicos')
          .withConverter<Servico>(
            fromFirestore: (snapshot, _) => Servico.fromJson(snapshot.data()),
            toFirestore: (serv, _) => serv.toJson(),
          )
          .get();

      snapshot.docs.forEach((serv) {
        _lista.add(serv.data());
      });

      notifyListeners();
    }
  }

  UnmodifiableListView<Servico> get lista => UnmodifiableListView(_lista);

  // Armazena o prestador
  savePrestador(Prestador prestador) async {
    await prestadorRef
        .doc(auth.usuario!.uid)
        .set(prestador, SetOptions(merge: true));
    notifyListeners();
  }

  // Adiciona um serviço ao prestador
  adicionaServico(Servico servico) async {
    await db
        .collection("prestadores/${auth.usuario!.uid}/servicos")
        .get()
        .then((value) {
      servico.id = (value.size + 1).toString();
    }).whenComplete(() async {
      await db
          .collection('prestadores/${auth.usuario!.uid}/servicos')
          .withConverter<Servico>(
            fromFirestore: (snapshot, _) => Servico.fromJson(snapshot.data()),
            toFirestore: (serv, _) => serv.toJson(),
          )
          .doc(servico.id)
          .set(servico, SetOptions(merge: true));
    });

    notifyListeners();
  }

  // Atualiza o prestador logado.
  getPrestadorUsuario(idUsuario) async {
    prestadorLogado = await prestadorRef
        .doc(auth.usuario!.uid)
        .get()
        .then((value) => value.data());

    notifyListeners();
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
