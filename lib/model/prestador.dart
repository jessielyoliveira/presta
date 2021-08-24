import 'package:presta/model/usuario.dart';

class Prestador extends Usuario {
  int quantServicos;
  List<String> telefones;

  Prestador(quantServicos, telefones, nome, email, senha)
      : this.quantServicos = quantServicos,
        this.telefones = telefones,
        super(nome, email, senha);

  get getQuantServicos => this.quantServicos;
  set setQuantServicos(quantServicos) => this.quantServicos = quantServicos;

  get getTelefones => this.telefones;
  set setTelefones(telefones) => this.telefones = telefones;
}
