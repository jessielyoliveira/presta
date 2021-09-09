import 'package:flutter/material.dart';
import 'package:presta/dao/prestadorDao.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/TelaCadastro.dart';
import 'package:presta/screens/prestador/perfil.dart';

class LoginScreen extends StatefulWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key key, login, senha}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                key: widget._formKey,
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
              Text(
                "Ainda não possui uma conta?",
                style: TextStyle(color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () {
                  direcionar(context, TelaCadastro());
                },
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
    ));
  }

  // Gerador do campo de Login
  TextFormField _textFormFieldEmail() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget._tLogin,
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
      controller: widget._tSenha,
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
    final login = widget._tLogin.text;
    final senha = widget._tSenha.text;

    if (!widget._formKey.currentState.validate()) return;

    var prestadorLogado = findPrestador(login, senha);
    if (prestadorLogado != null) {
      direcionar(
          context,
          PerfilPrestador(
            prestador: prestadorLogado,
          ));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                content: Text("E-mail e/ou senha inválidos."),
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
