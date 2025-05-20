import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class LoginPageViewModel with ChangeNotifier {
  final FirebaseAuth _auth =
      FirebaseAuth
          .instance; //servizio di autenticazone di firebase per gestire login , registrzìazione ecc,

  final TextEditingController emailController =
      TextEditingController(); //controllo email

  final TextEditingController passwordController =
      TextEditingController(); // controllo password

  final Auth_repository repository;

  final AuthFacebookRepository repository2;

  String _errorMessage = ""; //eventuale messaggio di errore

  bool _isLoading = false;

  LoginPageViewModel(this.repository, this.repository2);

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  //FUNZIONE DI LOGIN NORMALE
  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _errorMessage = "Tutti i campi sono obbligatori";
      notifyListeners();
      return;
    }
    //GESTIONE ERRORI NEL MOMENTO IN CUI SI EFFETTUA IL NORMALE LOGIN
    try {
      _isLoading = true;
      _errorMessage = "";
      notifyListeners();
      //SI PROVA A FARE L'ACCESSO CON MAIL E PASSWORD INSERITI
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      //SI PRELEVA L'ERRORE
      _errorMessage = _getErrorMessage(e.code);
    } catch (e) {
      _errorMessage = "Login failed. Check email and password.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // E' UN MODO PER STAMPARE UN ERRORE IN BASE AL MESSAGGIO DI ERRORE CHE VIENE RESTITUITO
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

  //LOGIN CON GOOGLE
  Future<void> loginWithGoogle() async {
    _isLoading = true; // Imposta il loading
    notifyListeners(); // Notifica alla view che lo stato è cambiato

    try {
      final userCredential = await repository.signInWithGoogle();

      if (userCredential != null) {
        // L'utente è stato loggato con successo
        print('Login riuscito: ${userCredential.user?.displayName}');

        // Puoi navigare verso la HomePage o altra schermata qui
      } else {
        // Se l'utente è null, significa che qualcosa è andato storto
        _errorMessage = 'Errore durante il login con Google';
        notifyListeners();
      }
    } catch (e) {
      // Se c'è un errore, gestiamolo
      _errorMessage = 'Errore: $e';
      print('Errore login con Google: $e');
    }

    _isLoading = false; // Fine del processo di login
    notifyListeners(); // Notifica alla view che lo stato è cambiato
  }

  Future<void> SignOut() async {
    repository.signOut();
  }

  //LOGIN CON FACEBOOK
  Future<void> loginWithFacebook() async {
    _isLoading = true;
    notifyListeners();
    try {
      //SI RICHIAMA LA FUNZIONE PER FARE L'ACCESSO CON FACEBOOK
      final result = await repository2.signInWithfacebook();
      if (result != null) {
        //LOGIN FATTO
        print('Login Riuscito');
        _isLoading = false;
        notifyListeners();
      } else {
        //LOGIN FALLITO
        print('Login Fallito');
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Errore nel login :$e');
      _isLoading = false;
    }
  }

  //FUNZIONE DI LOGOUT PER FACEBOOK
  Future<void> SignOutfacebook() async {
    repository2.signOut();
  }

  Future<void> resetpassword(String Email) async {
    try {
      //si invia la mail di reset passowrd all utente tramite la mail che viene messa in ingresso nella funzione
      await _auth.sendPasswordResetEmail(email: Email);
    } on FirebaseAuthException catch (e) {
      //gestisci errori
      if (e.code == 'user-not-found') {
        //se l'errore è USER-NOT FOUND stampa nessu utente trovato con questa mail
        throw 'nessun utente trovato con questa mail';
      } else {
        //altrimenti stampa errore durante il reset con il messaggio di errore preso da firebase
        throw 'Errore durante il reset della password:${e.message}';
      }
    }
  }
}
