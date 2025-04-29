import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/data/services/auth_service_facebook.dart';

class AuthFacebookRepository {
  final AuthServiceFacebook _authServiceFacebook = AuthServiceFacebook();

  // Funzione per effettuare il login con Google
  Future<UserCredential?> signInWithfacebook() async {
    return await _authServiceFacebook.signInWithFacebook();
  }

  // Funzione per effettuare il logout
  Future<void> signOut() async {
    await _authServiceFacebook.SignOut();
  }

  // Funzione per ottenere l'utente corrente
  User? getCurrentUser() {
    return _authServiceFacebook.currentUser;
  }
}
