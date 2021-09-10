import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutenticacaoException implements Exception {
  String mensagem;
  AutenticacaoException(this.mensagem);
}


class Autenticacao extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;

  bool isLoading = true;

  final googleSignIn = GoogleSignIn();
  // get getUsuario => this.usuario;

  Autenticacao() {
    _checaAutenticacao();
  }

  _checaAutenticacao() {
    _auth.authStateChanges().listen((User? u) {
      usuario = (u == null) ? null : u;
      isLoading = false;

      notifyListeners();
     });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  criarConta(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      throw new AutenticacaoException(e.message.toString());
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      throw new AutenticacaoException(e.message.toString());
    }
  }

  googleLogin() async {
    final googleUsuario = await googleSignIn.signIn();
    if (googleUsuario == null) return;

    final googleAutenticacao = await googleUsuario.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAutenticacao.accessToken,
      idToken: googleAutenticacao.idToken
    );

    await _auth.signInWithCredential(credential);
    _getUser();
    notifyListeners();
  }

  
  logout() async {
    googleSignIn.disconnect();
    await _auth.signOut();
    _getUser();
  }

}