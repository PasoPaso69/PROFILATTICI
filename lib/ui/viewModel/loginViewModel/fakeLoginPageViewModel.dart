/* Questa fakeloginPageViewModel è una versione di test della loginPageViewModel
che implementa le stesse interfacce ma non esegue operazioni reali, utile per testare la UI senza dipendenze esterne.
L'ho creata appunto perchè le dipendenzr esterne come firebase (usate per la logica di autenticazione
creavano problemi nei test. */

import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';

class FakeLoginPageViewModel with ChangeNotifier implements LoginPageViewModel {
  @override
  final TextEditingController emailController = TextEditingController();

  @override
  final TextEditingController passwordController = TextEditingController();

  // Gestione form validità basata sul contenuto controller
  @override
  bool get isFormValid => emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  // Costruttore per aggiornare i listener quando cambia il testo
  FakeLoginPageViewModel() {
    emailController.addListener(() {
      notifyListeners();
    });
    passwordController.addListener(() {
      notifyListeners();
    });
  }

  @override
  String errorMessage = "";

  @override
  bool get isLoading => false;

  @override
  Future<void> login() async {}

  // Altri metodi non implementati rimangono con throw
  @override
  Future<void> SignOut() => throw UnimplementedError();
  @override
  Future<void> SignOutfacebook() => throw UnimplementedError();
  @override
  Future<void> loginWithFacebook() => throw UnimplementedError();
  @override
  Future<void> loginWithGoogle() => throw UnimplementedError();
  @override
  Future<void> resetpassword(String Email) => throw UnimplementedError();

  @override
  // TODO: implement repository
  Auth_repository get repository => throw UnimplementedError();

  @override
  // TODO: implement repository2
  AuthFacebookRepository get repository2 => throw UnimplementedError();

  void setEmail(String value) {
  emailController.text = value;
  notifyListeners();
}

void setPassword(String value) {
  passwordController.text = value;
  notifyListeners();
}

 
}