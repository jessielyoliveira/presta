import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServico extends StatefulWidget {
  @override
  _AddServicoState createState() => _AddServicoState();
}

class _AddServicoState extends State<AddServico> {
  @override
  Widget build(BuildContext context) {
    int contador = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber,
        title: Text("Adicionar Serviço"),
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
                ElevatedButton(
                  onPressed: () {
                    // if (contador<4){
                    //for()
                    //}
                  },
                  child: Icon(Icons.add_a_photo),
                ),
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
            Padding(padding: EdgeInsets.only(bottom: 40)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Novo Registro",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}
