import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';

class RegisterPage2 extends StatefulWidget {
  @override
  _RegisterPage2State createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool _isloading = false;
  String? errormessage = "";

  Future<void> _Register() async {
    if (_passwordController.text != _confirmpasswordController.text) {
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
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pop(context); //torna alla schermata indietro
    } catch (e) {
      setState(() {
        //per gli errori sempre setstate
        _isloading = false;
        errormessage = _getErrorMessage((e as FirebaseAuthException).code);
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
      appBar: AppBar(backgroundColor: Colors.cyanAccent, toolbarHeight: 30),
      backgroundColor: Colors.cyanAccent,
      body: Padding(
        padding: EdgeInsets.all(0),
        //crea una spaziatura uguale dal basso alto destras e sinistra
        child: Column(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                height: 100,
                width: 100,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: 700,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 65),
                    child: Text(
                      "Registrati a Scan&Safe",

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/vecteezy_google-logo-transparent-png_42165816.png',
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          'assets/images/images.png',
                          fit: BoxFit.contain,

                          alignment: Alignment.center,
                        ),
                        Image.asset(
                          'assets/images/10464408.png',
                          alignment: Alignment.centerRight,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      textAlign: TextAlign.center,
                      "---------------- oppure ----------------",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.8),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: 5,
                      left: 25,
                      right: 25,
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "inserisci la tua mail",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.8),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: 5,
                      right: 25,
                      left: 25,
                    ),

                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "inserisci la tua password",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Conferma Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.8),

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: 5,
                      left: 25,
                      right: 25,
                    ),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        labelText: "inserisci di nuovo la tua password",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),

                  if (errormessage != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        errormessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(width: 30, height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        minimumSize: Size(325, 50),
                      ),
                      onPressed: _isloading ? null : _Register,
                      child: Text("Procedi"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 75, right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Hai gia un account? accedi",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
