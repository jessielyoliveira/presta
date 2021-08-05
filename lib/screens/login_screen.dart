import 'package:flutter/material.dart';
import 'package:presta/screens/cliente/solicitacao_servico.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool continueConnected = false;

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
                Colors.yellow[600],
                Colors.yellow[100],
              ])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("PRESTA APP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                Padding(padding: EdgeInsets.only(bottom: 45)),
                Text(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon:
                                Icon(Icons.mail_outline, color: Colors.black),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                GestureDetector(
                  onTap: () {
                    print("FUNCIONOU!");
                  },
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Checkbox(
                        value: this.continueConnected,
                        onChanged: (bool newValue) {
                          setState(() {
                            this.continueConnected = newValue;
                          });
                        }),
                    Text(
                      "Continuar conectado?",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SolicitacaoServicos()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.yellow[600]),
                    ),
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(color: Colors.black),
                ),
                Text(
                  "Ainda não possui uma conta?",
                  style: TextStyle(color: Colors.black),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Cadastre-se",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: Colors.yellowAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ])),
    );
  }
}
