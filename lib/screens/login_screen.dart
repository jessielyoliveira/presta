import 'package:flutter/material.dart';
import 'package:presta/screens/cliente/servicos.dart';
import 'package:presta/screens/estrutura.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool continueConnected = false;

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                key: _formKey,
                child: Column(
                  children: [_textFormFieldEmail(), _textFormFieldSenha()],
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
              _buttonLogin(context),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: Colors.black),
              ),
              Text(
                "Ainda não possui uma conta?",
                style: TextStyle(color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellowAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ]),
      ),
    );
  }

  // Gerador do campo de Login
  TextFormField _textFormFieldEmail() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: _tLogin,
      validator: _validaEmail,
      decoration: InputDecoration(
          labelText: "E-mail",
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.mail_outline, color: Colors.black),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }

  // Gerador do campo de Senha
  TextFormField _textFormFieldSenha() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _tSenha,
      validator: _validaSenha,
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }

  ElevatedButton _buttonLogin(context) {
    return ElevatedButton(
      onPressed: () {
        _onClickLogin(context);
      },
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }

  // Realiza a validação do login
  String _validaEmail(String text) {
    return (text.isEmpty) ? "Informe o e-mail" : null;
  }

  // Realiza a validação da senha
  String _validaSenha(String text) {
    return (text.isEmpty) ? "Informe a senha" : null;
  }

// Realiza o acesso do usuário
  void _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    if (!_formKey.currentState.validate()) return;

    if (login == "teste@teste.com" && senha == "1234") {
      direcionar(context, Servicos());
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("Erro"),
                content: Text("E-mail e/ou Senha inválido(s)"),
                actions: <Widget>[
                  TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ]);
          });
    }
  }
}
