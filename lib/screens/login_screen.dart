import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:presta/model/prestador.dart';
import 'package:presta/repositories/prestador_repository.dart';
import 'package:presta/screens/TelaCadastro.dart';
import 'package:presta/screens/escolherServicos.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/service/autenticacao.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final senha = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? continueConnected = false;

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
              Color(Colors.yellow.shade600.value),
              Color(Colors.yellow.shade100.value)
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
                key: formKey,
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
                      onChanged: (bool? newValue) {
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
              _buttonLoginGoogle(context),
              Text(
                "Ainda não possui uma conta?",
                style: TextStyle(color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                onPressed: () async {
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
      controller: email,
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
  TextFormField _textFormFieldSenha() {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: senha,
      validator: (text) {
        if (text!.isEmpty) return "Informe a senha";
      },
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
        if (formKey.currentState!.validate()) {
          login();
        }
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

  ElevatedButton _buttonLoginGoogle(context) {
    return ElevatedButton.icon(
        onPressed: () {
          loginGoogle();
        },
        icon: Icon(
          FontAwesomeIcons.google,
          color: Colors.black,
        ),
        label: Text(
          'Login with Google',
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.yellow[600],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))));
  }

  // Realiza o login do usuário com email e senha
  void login() async {
    try {
      await context
          .read<Autenticacao>()
          .login(email.text.trim(), senha.text.trim());

      await context
          .read<PrestadorRepository>()
          .getPrestadorUsuario(context.read<Autenticacao>().usuario!.uid);

      direcionarPosLogin(
          context, context.read<PrestadorRepository>().prestadorLogado!);
    } on AutenticacaoException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

  // Realiza o login pela conta Google
  void loginGoogle() async {
    try {
      await context.read<Autenticacao>().googleLogin();

      await context
          .read<PrestadorRepository>()
          .getPrestadorUsuario(context.read<Autenticacao>().usuario!.uid);

      if (context.read<PrestadorRepository>().prestadorLogado == null) {
        User? u = context.read<Autenticacao>().usuario;

        Prestador p = Prestador(
            idUsuario: u!.uid,
            nome: (u.displayName == null) ? "" : u.displayName,
            email: u.email,
            urlImagem: (u.photoURL == null) ? "" : u.photoURL,
            contato: (u.phoneNumber == null) ? "" : u.phoneNumber,
            categorias: mapCategorias,
            disponivel: false);

        // await context.read<PrestadorRepository>().savePrestador(p);

        // await context
        //     .read<PrestadorRepository>()
        //     .getPrestadorUsuario(context.read<Autenticacao>().usuario!.uid);

        direcionar(context, TelaCadastro(prestador: p));
      } else {
        if (context.read<PrestadorRepository>().prestadorLogado!.categorias ==
            null) {
          direcionar(
              context,
              EscolherServicos(
                  prestador:
                      context.read<PrestadorRepository>().prestadorLogado!));
        }

        direcionarPosLogin(
            context, context.read<PrestadorRepository>().prestadorLogado!);
      }
    } on AutenticacaoException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }
}
