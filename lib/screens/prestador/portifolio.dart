import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/addServico.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/screens/prestador/verservico.dart';
import 'package:provider/provider.dart';

class Portifolio extends StatefulWidget {
  final Prestador prestador;
  Portifolio({Key? key, required this.prestador}) : super(key: key);

  @override
  _PortifolioState createState() => _PortifolioState();
}

class _PortifolioState extends State<Portifolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.amber,
        title: Text("Portifólio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            direcionar(context, PerfilPrestador(prestador: widget.prestador));
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                direcionar(
                    context,
                    AddServico(
                      prestador: widget.prestador,
                    ));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: context.read<PrestadorRepository>().lista.length,
              itemBuilder: (context, i) {
                return buildServicoItem();
              }),
        ),
      ),
    );
  }

  Widget buildServicoItem() => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
              title: const Text('Serviço Nº. 6'),
              subtitle: Text(
                'Categoria: Macenaria',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    direcionar(
                        context,
                        Servico(
                            prestador: context
                                .read<PrestadorRepository>()
                                .prestadorLogado!));
                  },
                  child: const Text('Ver Mais'),
                ),
              ],
            )
          ],
        ),
      );
}
