import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthServiceFacebook {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.i.login(
        permissions: ['email', 'public_profile'],
      );
      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        return await _auth.signInWithCredential(facebookAuthCredential);
      } else {
        print('Login fallito con facebook: ${loginResult.message}');
        return null;
      }
    } catch (e) {
      print('Errore durante il login con Facebook');
      return null;
    }
  }

  Future<void> SignOut() async {
    await FacebookAuth.instance.logOut();
    return null;
  }

  User? get currentUser => _auth.currentUser; //resistuisce l'utente attuale
}
