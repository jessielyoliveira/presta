import 'package:presta/model/usuario.dart';

class Prestador extends Usuario {
  int quantServicos;
  List<String> telefones;

  Prestador(quantServicos, telefones)
      : this.quantServicos = quantServicos,
        this.telefones = telefones,
        super(null, null, null);
}

List<Prestador> getPrestadores() => [
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
      Prestador('Maria', 98),
      Prestador('João', 83),
      Prestador('Ana', 1),
    ];
