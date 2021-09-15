import 'package:cloud_firestore/cloud_firestore.dart';

class Prestador {
  String? idUsuario;
  String? nome;
  String? email;
  String? urlImagem;
  String? contato;
  Map<String, bool>? categorias;
  bool disponivel;

  Prestador(
      {this.idUsuario,
      this.nome,
      this.email,
      this.urlImagem,
      this.contato,
      this.categorias,
      this.disponivel = false});

  Prestador.fromJson(Map<String, dynamic>? json)
      : this(
            idUsuario: json!['idUsuario'],
            nome: json['nome'],
            email: json['email'],
            urlImagem: json['urlImagem'],
            contato: json['contato'],
            categorias: {
              "alvenaria": json['categorias']['alvenaria'],
              "eletrica": json['categorias']['eletrica'],
              "hidraulica": json['categorias']['hidraulica'],
              "pintura": json['categorias']['pintura'],
              "marcenaria": json['categorias']['marcenaria'],
              "vidracaria": json['categorias']['vidracaria'],
            },
            disponivel: json['disponivel']);

  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email,
      'urlImagem': urlImagem,
      'contato': contato,
      'categorias': {
        "alvenaria": categorias!['alvenaria'],
        "eletrica": categorias!['eletrica'],
        "hidraulica": categorias!['hidraulica'],
        "pintura": categorias!['pintura'],
        "marcenaria": categorias!['marcenaria'],
        "vidracaria": categorias!['vidracaria'],
      },
      'disponivel': disponivel
    };
  }
}

final prestadorRef = FirebaseFirestore.instance
    .collection('prestadores')
    .withConverter<Prestador>(
      fromFirestore: (snapshot, _) => Prestador.fromJson(snapshot.data()),
      toFirestore: (prestador, _) => prestador.toJson(),
    );

Map<String, bool> mapCategorias = {
  "alvenaria": false,
  "eletrica": false,
  "hidraulica": false,
  "pintura": false,
  "marcenaria": false,
  "vidracaria": false,
};
