import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/cliente/servicos.dart';

List<String> _estados = <String>[
  'Acre (AC)',
  'Alagoas (AL)',
  'Amapá (AP)',
  'Amazonas (AM)',
  'Bahia (BA)',
  'Ceará (CE)',
  'Distrito Federal (DF)',
  'Espírito Santo (ES)',
  'Goiás (GO)',
  'Maranhão (MA)',
  'Mato Grosso (MT)',
  'Mato Grosso do Sul (MS)',
  'Minas Gerais (MG)',
  'Pará (PA)',
  'Paraíba (PB)',
  'Paraná (PR)',
  'Pernambuco (PE)',
  'Piauí (PI)',
  'Rio de Janeiro (RJ)',
  'Rio Grande do Norte (RN)',
  'Rio Grande do Sul (RS)',
  'Rondônia (RO)',
  'Roraima (RR)',
  'Santa Catarina (SC)',
  'São Paulo (SP)',
  'Sergipe (SE)',
  'Tocantins (TO)',
];

String dropdownValue;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.yellow[600],
            Colors.yellow[100],
          ])),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.yellow[600],
              Colors.yellow[100],
            ])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Padding(padding: EdgeInsets.only(bottom: 0)),

              Text("PRESTA APP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Text("Insira o nome da sua cidade!"),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_city_rounded),
                  hintText: 'Exemplo: Natal',
                  labelText: 'Cidade',
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),

              Center(
                child: Row(
                  children: [
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: dropdownValue,
                      //elevation: 5,
                      items: _estados
                          .map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Escolha seu estado'),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              /*Divider(
                height: 5,
                thickness: 1,
                //indent: 0,
                //endIndent: 0,
              ),
              */
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Continuar',
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                "OU",
                textAlign: TextAlign.center,
              ),
              /*
              Divider(
                height: 5,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
*/
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  direcionar(context, Servicos());
                },
                child: Text(
                  'Usar Localizaçao Atual',
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ]),
      ),
    ));
  }
}
