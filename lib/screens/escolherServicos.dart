import 'package:flutter/material.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/perfil.dart';

class EscolherServicos extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
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
                  _valorAlvenaria = value;
                  setState(() {});
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
                  _valorEletrica = value;
                  setState(() {});
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
                  _valorHidraulica = value;
                  setState(() {});
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
                  _valorVidracaria = value;
                  setState(() {});
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
                  _valorPintura = value;
                  setState(() {});
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
                  _valorMarcenaria = value;
                  setState(() {});
                },
                selectedColor: Colors.amber,
                showCheckmark: true,
              ),
              Padding(padding: EdgeInsets.all(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      direcionar(context, PerfilPrestador());
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
}
