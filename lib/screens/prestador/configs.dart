import 'package:flutter/material.dart';

class Configs extends StatefulWidget {
  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Configurações"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Disponível para Serviços",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              }),
          const Divider(
            height: 10,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Apagar Conta',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            icon: Icon(Icons.highlight_remove),
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
