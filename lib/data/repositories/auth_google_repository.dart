import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/data/services/auth-service_google.dart';

class Auth_repository {
  final AuthService _authService = AuthService();

  // Funzione per effettuare il login con Google
  Future<UserCredential?> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  // Funzione per effettuare il logout
  Future<void> signOut() async {
    await _authService.signOut();
  }

  // Funzione per ottenere l'utente corrente
  User? getCurrentUser() {
    return _authService.currentUser;
  }
}
