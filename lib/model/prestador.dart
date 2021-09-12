
import 'package:cloud_firestore/cloud_firestore.dart';

class Prestador {
  String idUsuario;
  String? nome;
  String? email;
  String? urlImagem; 
  String? contato;

  Prestador({required this.idUsuario, this.nome, required this.email, this.urlImagem, this.contato});

  Prestador.fromJson(Map<String, dynamic>? json)
    : this(
        idUsuario: json!['idUsuario'],
        nome: json['nome'],
        email: json['email'],
        urlImagem: json['urlImagem'],
        contato: json['contato'],
      );


  Map<String, dynamic> toJson() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email, 
      'urlImagem': urlImagem,
      'contato': contato,
    };
  }
  
}
  
final prestadorRef = FirebaseFirestore.instance.collection('prestadores').withConverter<Prestador>(
    fromFirestore: (snapshot, _) => Prestador.fromJson(snapshot.data()),
    toFirestore: (prestador, _) => prestador.toJson(),
  );