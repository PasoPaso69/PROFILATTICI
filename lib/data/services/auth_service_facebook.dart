import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthServiceFacebook {
  //RICHIAMIAMO L'INSTANZA DI FACEBOOK
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      //INSTANZIAMO IL LOGIN CON I RELAITIVI PERMESSI
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
        loginBehavior: LoginBehavior.nativeWithFallback,
      );

      //PRINT E CONTROLLI PER VEDERE SE TUTTO FUNZIONA
      print("Facebook login status: ${loginResult.status}");
      if (loginResult.status == LoginStatus.success) {
        // Accedi al token di accesso da Facebook
        final accessToken = loginResult.accessToken;

        // Verifica se l'accessToken è valido
        if (accessToken != null && accessToken.token.isNotEmpty) {
          // Crea un OAuthCredential con il token di accesso
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken.token);

          // Esegui il login con il credenziale di Facebook su Firebase
          final userCredential = await _auth.signInWithCredential(
            facebookAuthCredential,
          );

          // Ritorna il risultato del login
          return userCredential;
        } else {
          // Se l'accessToken è nullo o vuoto, segnala l'errore
          print("Access Token non valido o nullo");
          return null;
        }
      } else {
        print('Login fallito con facebook: ${loginResult.message}');
        return null;
      }
    } catch (e) {
      print('Errore durante il login con Facebook');
      return null;
    }
  }

  //FUNZIONE PER FARE IL LOGOUT DA FACEBOOK
  Future<void> SignOut() async {
    await _auth.signOut();
    await FacebookAuth.instance.logOut();
  }

  User? get currentUser => _auth.currentUser; //resistuisce l'utente attuale
}
