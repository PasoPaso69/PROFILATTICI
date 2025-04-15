import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class RegisterPageViewModel with ChangeNotifier {

  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  //bool _isloading = false;
  String errormessage = "";
  bool isLoading = false;

  Future<void> register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty || confirmpasswordController.text.isEmpty){
      errormessage = "Tutti i campi sono obbligatori";
      notifyListeners();
      return;
    }




    if (passwordController.text != confirmpasswordController.text) {
       
        errormessage = "Le password non coincidono";
      notifyListeners();
      return;
    }

     isLoading =true;
     errormessage = "";
     notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

       //torna alla schermata indietro
    }on FirebaseAuthException catch (e){
      errormessage = _getErrorMessage(e.code);
    } catch (e) {
        errormessage = "Errore imprevisto, riprova";
      
    } finally{
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
}