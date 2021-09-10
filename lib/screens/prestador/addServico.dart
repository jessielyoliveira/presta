import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/portifolio.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class AddServico extends StatefulWidget {
  final Prestador prestador;
  AddServico({Key? key, required this.prestador}) : super(key: key);
  @override
  _AddServicoState createState() => _AddServicoState();
}

class _AddServicoState extends State<AddServico> {
  @override
  Widget build(BuildContext context) {
    //int contador = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text(
          "Adicionar Serviço",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            direcionar(
                context,
                Portifolio(
                  prestador: widget.prestador,
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.grey[180],
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      //adicionar imagepicker
                    },
                    label: Text(
                      'Adicionar da Galeria',
                      style: TextStyle(color: Colors.amber),
                    ),
                    icon: Icon(
                      Icons.photo_album,
                      color: Colors.amber,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      //Adicionar imagePicker
                    },
                    label: Text(
                      'Adicionar da Câmera',
                      style: TextStyle(color: Colors.amber),
                    ),
                    icon: Icon(
                      Icons.photo_camera,
                      color: Colors.amber,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 2.5,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imgList
                      .map((item) => Container(
                            child: Center(
                                child: Image.network(
                              item,
                              fit: BoxFit.fitHeight,
                              width: MediaQuery.of(context).size.height,
                            )),
                          ))
                      .toList()),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
              ),
              Row(
                children: [
                  Text(
                    "   Resumo do Serviço",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),

                  hintText: 'Digite aqui',
                  //helperText: 'Texto de ajuda',
                  labelText: 'Descrição',
                ),
                maxLines: 4,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex.: Natal-RN',
                  //helperText: 'Texto de ajuda',
                  labelText: 'Local',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex.: João',
                  //helperText: 'Texto de ajuda',
                  labelText: 'Cliente',
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 18)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ex.: 2 dias',
                  //helperText: 'Texto de ajuda',
                  labelText: 'Tempo de Duração',
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              ElevatedButton.icon(
                onPressed: () {
                  //adicionar imagepicker
                },
                label: Text(
                  'Adicionar',
                  style: TextStyle(color: Colors.amber),
                ),
                icon: Icon(
                  Icons.add,
                  color: Colors.amber,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
