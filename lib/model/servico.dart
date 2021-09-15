class Servico {
  String? id;
  String? descricao;
  String? duracao;

  Servico({this.id, this.descricao, this.duracao});

  Servico.fromJson(Map<String, dynamic>? json)
      : this(descricao: json!['descricao'], duracao: json['duracao']);

  Map<String, dynamic> toJson() {
    return {'descricao': descricao, 'duracao': duracao};
  }
}
