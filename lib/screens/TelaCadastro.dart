import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/escolherServicos.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/login_screen.dart';

class TelaCadastro extends StatefulWidget {
  final Prestador? prestador;
  TelaCadastro({Key? key, this.prestador}) : super(key: key);

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
    if (widget.prestador != null) {
      widget._tNome.text = widget.prestador!.nome!;
      widget._tLogin.text = widget.prestador!.email!;
      widget._tTelefone.text = widget.prestador!.contato!;
    }

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
            Colors.yellow[600]!,
            Colors.yellow[100]!,
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
                children: <Widget>[
                  _textFormFieldNome(),
                  _textFormFieldTelefone(),
                  _textFormFieldEmail(),
                  _textFormFieldSenha(),
                  _textFormFieldConfirmarSenha()
                ]),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (widget._formKey.currentState!.validate()) {
                    if (widget._tSenha.text.trim() !=
                        widget._tConfirmarSenha.text.trim()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Os campos de senha devem ser iguais')));
                    } else {
                      criarConta();
                    }
                  }
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
              Container(width: 10),
              ElevatedButton(
                onPressed: () {
                  direcionar(context, LoginScreen());
                },
                child: Text(
                  'Voltar',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ],
      ),
    )));
  }

  // Realiza a validação da senha
  String? _validaSenha(String? text) {
    if (text!.isEmpty) return "Informe a senha";
    if (text.length < 6) return "A senha deve conter no mínimo 6 caracteres";
  }

// Gerador do campo de telefone
  TextFormField _textFormFieldTelefone() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter()
      ],
      autofocus: false,
      controller: widget._tTelefone,
      validator: (text) {
        if (text!.isEmpty) return "Informe o telefone";
      },
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
      validator: (text) {
        if (text!.isEmpty) return "Informe o nome";
      },
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

  bool editaText(BuildContext context) {
    return context.read<Autenticacao>().googleSignIn.currentUser == null;
  }

// Gerador do campo de Login
  TextFormField _textFormFieldEmail() {
    return TextFormField(
      enabled: editaText(context),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget._tLogin,
      validator: (text) {
        if (text!.isEmpty) return "Informe o e-mail";
      },
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
  _textFormFieldSenha() {
    if (context.read<Autenticacao>().googleSignIn.currentUser != null) {
      return Container();
    }

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
  _textFormFieldConfirmarSenha() {
    if (context.read<Autenticacao>().googleSignIn.currentUser != null) {
      return Container();
    }

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

  void criarConta() async {
    // try {
    Prestador p;

    if (context.read<Autenticacao>().googleSignIn.currentUser == null) {
      await context
          .read<Autenticacao>()
          .criarConta(widget._tLogin.text.trim(), widget._tSenha.text.trim());

      p = Prestador(
          idUsuario: context.read<Autenticacao>().usuario!.uid,
          nome: widget._tNome.text.trim(),
          email: widget._tLogin.text.trim(),
          urlImagem: "",
          contato: widget._tTelefone.text.trim(),
          categorias: mapCategorias,
          disponivel: false);
    } else {
      // Autenticacao a = context.read<Autenticacao>();

      widget.prestador!.nome = widget._tNome.text.trim();
      widget.prestador!.contato = widget._tTelefone.text.trim();

      await context
          .read<PrestadorRepository>()
          .savePrestador(widget.prestador!);

      // await context
      //     .read<PrestadorRepository>()
      //     .getPrestadorUsuario(context.read<Autenticacao>().usuario!.uid);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Usuário criado')));

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EscolherServicos(
                    prestador: widget.prestador!,
                  )));
      // } on AutenticacaoException catch (e) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text(e.mensagem)));
      // }
    }
  }
}
