import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/portifolio.dart';
import 'package:image_picker/image_picker.dart';

final List<String> imgList = [];

class AddServico extends StatefulWidget {
  final Prestador prestador;
  AddServico({Key key, @required this.prestador}) : super(key: key);
  @override
  _AddServicoState createState() => _AddServicoState();
}

class _AddServicoState extends State<AddServico> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageFileList = [];

  @override
  Widget build(BuildContext context) {
    final double altura = MediaQuery.of(context).size.height / 2.5;
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
                    onPressed: () async {
                      selectImages();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Imagens Adicionadas'),
                      ));
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
                    onPressed: () async {
                      takePicture();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Imagem Adicionada'),
                      ));
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
              Container(
                height: altura,
                width: 2 * altura,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageFileList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(File(_imageFileList[index].path));
                  },
                ),
              ),

              /*CarouselSlider(
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
                      .map((file) => Container(
                            child: Center(
                                child: Image.file(file)(
                              item,
                              fit: BoxFit.fitHeight,
                              width: MediaQuery.of(context).size.height,
                            )),
                          ))
                      .toList()),*/
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

  void selectImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      _imageFileList.addAll(selectedImages);
    }
    print("Image list lenght: " + _imageFileList.length.toString());

    setState(() {});
  }

  void takePicture() async {
    final XFile takedPhoto =
        await _picker.pickImage(source: ImageSource.camera);
    _imageFileList.add(takedPhoto);

    print("Image list lenght: " + _imageFileList.length.toString());
    setState(() {});
  }
}
