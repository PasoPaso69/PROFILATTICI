import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassowrdController = TextEditingController();

  bool _isloading = false;
  String? errormessage = "";

  Future<void> _Register() async {
    if (_passwordController != _confirmpassowrdController) {
      setState(() {
        errormessage = "le password non coincidono";
      });
      return;
    }

    setState(() {
      _isloading = true;
      errormessage = null;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pop(context); //torna alla schermata indietro
    } catch (e) {
      setState(() {
        //per gli errori sempre setstate
        _isloading = false;
        errormessage = "si è verificato un errore";
      });
    }
  }

  String _getErrorMessage(error) {
    switch (error) {
      case 'email-already-in-use':
        return "questa email è gia stata utilizzata";
      case 'invalid-email':
        return "email non valida";
      case 'weak-password':
        return "password troppo debole";
      default:
        return 'errore sconosciuto';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 30,
          height: 20,
          child: Text(
            "REGISTRAZIONE",
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 195, 255),
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          16.0,
        ), //crea una spaziatura uguale dal basso alto destras e sinistra
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "inserisci la tua email"),
              keyboardType: TextInputType.emailAddress,
            ),

            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "inserisci la tua password",
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            TextFormField(
              controller: _confirmpassowrdController,
              decoration: InputDecoration(
                labelText: "inserisci di nuovo la tua password",
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            if (errormessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  errormessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(width: 20, height: 10),
          ],
        ),
      ),
    );
  }
}
