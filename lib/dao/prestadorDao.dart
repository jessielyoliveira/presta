import 'package:presta/model/BD.dart';
import 'package:presta/model/prestador.dart';

Prestador findPrestador(String email, String senha) {
  for (Prestador p in prestadoresBanco) {
    if (p.email == email && p.senha == senha) {
      return p;
    }
  }
  return null;
}
