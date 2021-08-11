import 'dart:ui';

import 'package:flutter/material.dart';

class AddPortifolio extends StatefulWidget {
  @override
  _AddPortifolioState createState() => _AddPortifolioState();
}

class _AddPortifolioState extends State<AddPortifolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Adicionar Portifólio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("add imagem 01"),
                Text("add imagem 2"),
                Text("add imagem 3"),
              ],
            ),
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
            Padding(padding: EdgeInsets.only(bottom: 18)),
            RaisedButton(
                onPressed: () {},
                child: Text(
                  "Novo Registro",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ],
        ),
      ),
    );
  }
}
