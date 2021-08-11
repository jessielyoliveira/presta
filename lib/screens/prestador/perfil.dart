import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class perfilPrestador extends StatefulWidget {
  @override
  _perfilPrestadorState createState() => _perfilPrestadorState();
}

class _perfilPrestadorState extends State<perfilPrestador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Perfil"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24))),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(
                      'https://t3.ftcdn.net/jpg/03/91/19/22/360_F_391192211_2w5pQpFV1aozYQhcIw3FqA35vuTxJKrB.jpg'),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Text(
              "Fulano de Tal",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 10,
            )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('Média das avaliações: ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center),
                  Text(
                    "4,85",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ]),
            Padding(
                padding: EdgeInsets.only(
              bottom: 10,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('Total de Serviços Prestados: ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center),
                Text(
                  "356",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Disabled'),
            ),
          ],
        ),
      ),
    );
  }
}
