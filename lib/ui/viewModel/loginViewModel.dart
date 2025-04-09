import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageViewModel with ChangeNotifier {
  final FirebaseAuth _auth =
      FirebaseAuth
          .instance; //servizio di autenticazone di firebase per gestire login , registrzìazione ecc,
  final TextEditingController _emailController =
      TextEditingController(); //controllo email
  final TextEditingController _passwordController =
      TextEditingController(); // controllo password
  String _errorMessage = ""; //eventuale messaggio di errore
  bool _isLoading = false;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  Future<void> login() async {
    try {
      _isLoading = true;
      _errorMessage = "";
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getErrorMessage(e.code);
    } catch (e) {
      _errorMessage = "Login failed. Check email and password.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return "Utente non trovato";
      case 'wrong-password':
        return "Password errata";
      case 'invalid-email':
        return "Email non valida";
      default:
        return "errore durante il login ";
    }
  }
}
