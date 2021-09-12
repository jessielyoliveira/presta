class Servico {
  int id;
  String descricao;
  String duracao;

  Servico(this.id, this.descricao, this.duracao);

  Map<String, dynamic> toMap() {
    return {
      'id_servico': id,
      'descricao': descricao,
      'duracao': duracao 
    };
  }
  
}

Servico toServico(Map<String, dynamic> map) {
    return Servico(
      map['id_servico'], 
      map['descricao'],
      map['duracao']
    );
  }