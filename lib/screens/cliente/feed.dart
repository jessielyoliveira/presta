import 'package:flutter/material.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/perfil.dart';
import 'package:presta/screens/prestador/verservico.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  final String? texto;
  Feed({Key? key, required this.texto}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.amber,
          title: Text("Portifólio de Serviços em ${this.widget.texto}"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              /*direcionar(
                  context,
                  PerfilPrestador(
                      prestador: context
                          .read<PrestadorRepository>()
                          .prestadorLogado!));*/
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            //color: Colors.amber,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [],
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 6'),
                        subtitle: Text(
                          'Categoria: Macenaria',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /*direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 5'),
                        subtitle: Text(
                          'Categoria: Alvenaria',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /*direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 4'),
                        subtitle: Text(
                          'Categoria: Elétrica',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /* direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 3'),
                        subtitle: Text(
                          'Categoria: Macenaria',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /*direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 2'),
                        subtitle: Text(
                          'Categoria: Macenaria',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /*direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                        title: const Text('Serviço Nº. 1'),
                        subtitle: Text(
                          'Categoria: Macenaria',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              /* direcionar(
                                  context,
                                  DetalheServico(
                                      prestador: context
                                          .read<PrestadorRepository>()
                                          .prestadorLogado!));*/
                            },
                            child: const Text('Ver Mais'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
