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
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("add imagem 01"),
                Text("add imagem 2"),
                Text("add imagem 3"),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 18)),
            Row(
              children: [
                Text("   Descrição",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ],
            ),
            Row(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'pqpq',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
