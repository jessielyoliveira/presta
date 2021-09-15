import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

class EscolherServicos extends StatefulWidget {
  final Prestador prestador;
  EscolherServicos({Key? key, required this.prestador}) : super(key: key);
  @override
  _EscolherServicosState createState() => _EscolherServicosState();
}

class _EscolherServicosState extends State<EscolherServicos> {
  bool _valorAlvenaria = false;
  bool _valorEletrica = false;
  bool _valorHidraulica = false;
  bool _valorVidracaria = false;
  bool _valorPintura = false;
  bool _valorMarcenaria = false;

  late Map<String, bool> _categorias;

  @override
  Widget build(BuildContext context) {
    setEstadosCategorias();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.yellow[600],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(15)),
              Text(
                "ESCOLHA OS SERVIÇOS QUE DESEJA REALIZAR",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Alvenaria',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: this._valorAlvenaria,
                onSelected: (bool value) {
                  setState(() {
                    _valorAlvenaria = value;
                    _categorias['alvenaria'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Elétrica',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: _valorEletrica,
                onSelected: (bool value) {
                  setState(() {
                    _valorEletrica = value;
                    _categorias['eletrica'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Hidráulica',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: _valorHidraulica,
                onSelected: (bool value) {
                  setState(() {
                    _valorHidraulica = value;
                    _categorias['hidraulica'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Vidraçaria',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: _valorVidracaria,
                onSelected: (bool value) {
                  setState(() {
                    _valorVidracaria = value;
                    _categorias['vidracaria'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Pintura',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: _valorPintura,
                onSelected: (bool value) {
                  setState(() {
                    _valorPintura = value;
                    _categorias['pintura'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              FilterChip(
                label: Container(
                  width: 100,
                  height: 40,
                  child: Text(
                    'Marcenaria',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                ),
                backgroundColor: Colors.white70,
                shape: StadiumBorder(side: BorderSide()),
                selected: _valorMarcenaria,
                onSelected: (bool value) {
                  setState(() {
                    _valorMarcenaria = value;
                    _categorias['marcenaria'] = value;
                  });
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      context
                          .read<PrestadorRepository>()
                          .saveCategorias(widget.prestador.categorias!);

                      await context
                          .read<PrestadorRepository>()
                          .getPrestadorUsuario(
                              context.read<Autenticacao>().usuario!.uid);

                      direcionarPosLogin(context,
                          context.read<PrestadorRepository>().prestadorLogado!);
                    },
                    child: Text(
                      'Continuar',
                      style:
                          TextStyle(color: Colors.yellowAccent, fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 40),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ],
              )
            ]),
      ),
    );
  }

  void setEstadosCategorias() {
    _categorias = widget.prestador.categorias!;

    _valorAlvenaria = widget.prestador.categorias!['alvenaria'] as bool;
    _valorEletrica = widget.prestador.categorias!['eletrica'] as bool;
    _valorHidraulica = widget.prestador.categorias!['hidraulica'] as bool;
    _valorMarcenaria = widget.prestador.categorias!['marcenaria'] as bool;
    _valorPintura = widget.prestador.categorias!['pintura'] as bool;
    _valorVidracaria = widget.prestador.categorias!['vidracaria'] as bool;
  }
}
