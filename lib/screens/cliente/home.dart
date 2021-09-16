import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:presta/screens/cliente/feed.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/cliente/servicos.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

List<String> _cidades = <String>[
  'Natal',
  'Ceará - Mirim',
  'Extremoz',
  'Mossoró',
  'Parnamirim',
  'São Gonçalo do Amarante',
];

String? dropdownValue;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Position? _currentPosition;
  String? _currentAddress;
  String? cidade;

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
            Colors.yellow[600]!,
            Colors.yellow[100]!,
          ])),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.yellow[600]!,
              Colors.yellow[100]!,
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
              Text("Escolha a sua cidade"),

              /*TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_city_rounded),
                  hintText: 'Exemplo: Natal',
                  labelText: 'Cidade',
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
*/
              Center(
                child: Row(
                  children: [
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: dropdownValue,
                      //elevation: 5,
                      items: _cidades
                          .map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Escolha sua Cidade'),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value;
                          cidade = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: 25)),
              ElevatedButton(
                onPressed: () {
                  direcionar(
                      context,
                      Servicos(
                        texto: this.cidade,
                      ));
                },
                child: Text(
                  'Continuar',
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),

              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () async {
                  _getCurrentLocation();
                  direcionar(context, Servicos(texto: this._currentAddress));
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

              //"LATITUDE: ${_currentPosition.latitude}, LONGITUDE: ${_currentPosition.longitude} "),
            ]),
      ),
    ));
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.subAdministrativeArea}";
      });
    } catch (e) {
      print(e);
    }
  }
}
