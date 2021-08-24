import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avaliacao extends StatefulWidget {
  @override
  _AvaliacaoState createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Avaliações"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: ((MediaQuery.of(context).size.height) - 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        children: [
                          Column(
                              //foto
                              ),
                          Column(
                            children: [
                              Row(
                                  //nome cliente
                                  ),
                              Row(
                                  //data
                                  ),
                              Row(
                                  // rating
                                  ),
                              Row(
                                children: [Text("toque para ver mais")],
                              )
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
