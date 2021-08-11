import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class portifolio extends StatefulWidget {
  @override
  _portifolioState createState() => _portifolioState();
}

class _portifolioState extends State<portifolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Portifólio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {},
        ),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('chama outra tela');
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('chama outra tela');
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('chama outra tela');
                  },
                  child: const SizedBox(
                    width: double.maxFinite,
                    height: 200,
                    child: Text('Descriçao da obra'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
