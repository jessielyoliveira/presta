abstract class Usuario {
  String nome;
  String email;
  String senha;

  Usuario(nome, email, senha) {
    this.nome = nome;
    this.email = email;
    this.senha = senha;
  }

  get getNome => this.nome;
  set setNome(nome) => this.nome = nome;

  get getEmail => this.email;
  set setEmail(email) => this.email = email;

  get getSenha => this.senha;
  set setSenha(senha) => this.senha = senha;
}
