import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:presta/screens/estrutura.dart';
import 'package:presta/screens/prestador/TelaCadastro.dart';
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
      body: Container(
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    criarConta();
                  }
                },
                child: Text(
                  'Criar conta',
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
      controller: email,
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
      controller: senha,
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

  ElevatedButton _buttonLoginGoogle(context) {
    return ElevatedButton.icon(
      onPressed: () {loginGoogle();}, 
      icon: Icon(FontAwesomeIcons.google, color: Colors.black,), 
      label: Text(
        'Login with Google',
        style: TextStyle(color: Colors.black),),
      style: ElevatedButton.styleFrom(
          primary: Colors.yellow[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
    );
  }

  // Realiza a validação do login
  String? _validaEmail(String? text) {
    return (text!.isEmpty) ? "Informe o e-mail" : null;
  }

  // Realiza a validação da senha
  String? _validaSenha(String? text) {
    return (text!.isEmpty) ? "Informe a senha" : null;
  }

// Realiza o acesso do usuário
  void _onClickLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      login();
    }
  }

  void login() async {
    try {
      await context.read<Autenticacao>().login(email.text.trim(), senha.text.trim());
    } on AutenticacaoException catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }


  void loginGoogle() {
    context.read<Autenticacao>().googleLogin();
  }

  void criarConta() async {
    try {
      await context.read<Autenticacao>().criarConta(email.text.trim(), senha.text.trim());
    } on AutenticacaoException catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.mensagem)));
    }
  }

Future _loginGoogle(context) async {
  // final usuarioGoogle = await GoogleSignInApi.login();

  // if (usuarioGoogle == null) {
  //   ScaffoldMessenger.of(context)
  //     .showSnackBar(SnackBar(content: Text('Login falhou')));

  // } else {
    
  //   List<QueryDocumentSnapshot<Prestador>> getPrestador = await prestadorRef
  //     .limit(1)
  //     .where('email', isEqualTo: usuarioGoogle.email)
  //     .where('via_google', isEqualTo: true)
  //     .where('senha', isNull: true)
  //     .get().then((value) => value.docs);


  //   if (getPrestador == null) {
  //     prestadorRef.add(
  //       Prestador(
  //         id: 1,
  //         nome: usuarioGoogle.displayName, 
  //         email: usuarioGoogle.email, 
  //         senha: null,
  //         urlImagem: usuarioGoogle.photoUrl,
  //         contato: null, 
  //         loginViaGoogle: true
  //       )
  //     );
  //   }
    
  //   direciona
  //rPosLogin(context, getPrestador.last.data());    
  }
}



