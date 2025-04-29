import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/services/registrazioneService.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';

class RegisterPageViewModel with ChangeNotifier {
  final AuthService authService;
  final AuthFacebookRepository repository2;
  RegisterPageViewModel(this.authService, this.repository, this.repository2);
  final Auth_repository repository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  String errormessage = "";
  bool isLoading = false;

  Future<void> register() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      errormessage = "Tutti i campi sono obbligatori";
      notifyListeners();
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      errormessage = "Le password non coincidono";
      notifyListeners();
      return;
    }

    isLoading = true;
    errormessage = "";
    notifyListeners();

    try {
      await authService.register(emailController.text, passwordController.text);
    } on FirebaseAuthException catch (e) {
      errormessage = _getErrorMessage(e.code);
    } catch (e) {
      errormessage = "Errore imprevisto, riprova";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String _getErrorMessage(error) {
    switch (error) {
      case 'email-already-in-use':
        return "Questa email è gia stata utilizzata";
      case 'invalid-email':
        return "Email non valida";
      case 'weak-password':
        return "Password troppo debole";
      default:
        return 'Errore sconosciuto';
    }
  }

  Future<void> loginWithGoogle() async {
    isLoading = true; // Imposta il loading
    notifyListeners(); // Notifica alla view che lo stato è cambiato

    try {
      final userCredential = await repository.signInWithGoogle();

      if (userCredential != null) {
        // L'utente è stato loggato con successo
        print('Login riuscito: ${userCredential.user?.displayName}');
        // Puoi navigare verso la HomePage o altra schermata qui
      } else {
        // Se l'utente è null, significa che qualcosa è andato storto
        errormessage = 'Errore durante il login con Google';
        notifyListeners();
      }
    } catch (e) {
      // Se c'è un errore, gestiamolo
      errormessage = 'Errore: $e';
      print('Errore login con Google: $e');
    }

    isLoading = false; // Fine del processo di login
    notifyListeners(); // Notifica alla view che lo stato è cambiato
  }

  Future<void> SignOut() async {
   // final UserCredential = await repository.signInWithGoogle();
    //if (UserCredential != null) {
      repository.signOut();
    //}
  }

  Future<void> loginWithFacebook() async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await repository2.signInWithfacebook();
      if (result != null) {
        //LOGIN FATTO
        print('Login Riuscito');
        isLoading = false;
        notifyListeners();
      } else {
        print('Login Fallito');
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Errore nel login :$e');
      isLoading = false;
    }
  }

  Future<void> SignOutfacebook() async {
    repository2.signOut();
  }
}
