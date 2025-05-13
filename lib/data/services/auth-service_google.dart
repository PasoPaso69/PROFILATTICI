import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; // usi firebase auth
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(); // usi il popup di accesso google

  Future<UserCredential?> signInWithGoogle() async {
    // da qua
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null)
        return null; // a qua apre la schermata di accesso google

      final googleAuth =
          await googleUser
              .authentication; //prende dei token e id di accesso da google

      final credential = GoogleAuthProvider.credential(
        // questo token e id di accesso poi verrano usati per trasofrmarli in credenziali google utilizzabili da firebase
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //RITORNA LE CREDENZIALI DI ACCESSO
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign-In error: $e');
      return null;
    }
  }

  //FUNZIONE DI LOGOUT DA GOOGLE
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser; //resistuisce l'utente attuale
}
