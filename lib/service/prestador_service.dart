import 'package:flutter/widgets.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

late final Prestador? prestadorLogado;

Future<Prestador?> getPrestadorLogado(BuildContext context) async {

  if (prestadorLogado == null) {
    prestadorLogado = await Provider.of<PrestadorRepository>(context)
      .get(Provider.of<Autenticacao>(context).usuario!.uid);
  }

  return prestadorLogado;
}
