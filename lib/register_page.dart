import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/home_page.dart';
import 'package:flutter_application/register_page2.dart';
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

  //bool _isloading = false;
  String? errormessage = "";

  Future<void> _Register() async {
    if (_passwordController.text != _confirmpasswordController.text) {
      setState(() {
        errormessage = "Le password non coincidono";
      });
      return;
    }

    setState(() {
      //_isloading = true;
      errormessage = null;
    });

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterPage()),
      ); //torna alla schermata indietro
    } catch (e) {
      setState(() {
        //per gli errori sempre setstate
        //_isloading = false;
        errormessage = _getErrorMessage((e as FirebaseAuthException).code);
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, toolbarHeight: 30),
      backgroundColor: Colors.cyan,

      body: SingleChildScrollView(
        child: Padding(
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
                height: 585,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Registrati a Scan&Safe",

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 400,
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
                      padding: EdgeInsets.symmetric(horizontal: 30),
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 1.0,
                          horizontal: 63,
                        ),
                        child: Text(
                          errormessage!,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(250, 50),
                        ),
                        onPressed: _Register, //_isloading ? null
                        child: Text("Procedi"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 75, right: 10),
                      child: Row(
                        children: [
                          Text("Hai già un account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              " Accedi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyan,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
