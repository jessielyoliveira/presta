import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:presta/screens/escolherServicos.dart';
import 'package:presta/screens/estrutura.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
  final _tNome = TextEditingController();
  final _tTelefone = TextEditingController();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _tConfirmarSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}

// usar isso https://material.io/components/chips/flutter#filter-chips
class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.amberAccent,
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
        children: [
          Padding(padding: EdgeInsets.only(top: 35)),
          Text("PRESTA APP",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Informe seus dados abaixo.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Form(
            key: widget._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _textFormFieldNome(),
                _textFormFieldTelefone(),
                _textFormFieldEmail(),
                _textFormFieldSenha(),
                _textFormFieldConfirmarSenha()
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  direcionar(context, EscolherServicos());
                },
                child: Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Você também pode",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SignInButton(
            Buttons.GoogleDark,
            text: "Cadastrar com Google",
            onPressed: () {},
          )
        ],
      ),
    )));
  }

  // Realiza a validação da senha
  String _validaSenha(String text) {
    return (text.isEmpty) ? "Informe a senha" : null;
  }

// Gerador do campo de telefone
  TextFormField _textFormFieldTelefone() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      controller: widget._tTelefone,
      decoration: InputDecoration(
          labelText: "Telefone",
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.phone, color: Colors.black),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }

// Gerador do campo de Login
  TextFormField _textFormFieldNome() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.name,
      controller: widget._tNome,
      decoration: InputDecoration(
          labelText: "Nome",
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.person, color: Colors.black),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }

// Gerador do campo de Login
  TextFormField _textFormFieldEmail() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget._tLogin,
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

  // Gerador do campo de confirmar Senha
  TextFormField _textFormFieldConfirmarSenha() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: widget._tConfirmarSenha,
      validator: _validaSenha,
      decoration: InputDecoration(
        labelText: "Confirme a Senha",
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
}
