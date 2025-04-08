import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/benvenuto.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'benvenuto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Richiesto per Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login',
      home: BenvenutoPage(), //prima schermata che si vede all apertura
    );
  }
}

class LoginPage extends StatefulWidget {
  // StatefulWidget è un  widget che puo cambiare il suo stato durante la vita dell applicazione
  @override
  _LoginPageState createState() => _LoginPageState(); // un metodo che viene usato negli stateful che crea uno stato e restituisce un istanza di _LoginPageState in questo caso---- => significa return
}

class _LoginPageState extends State<LoginPage> {
  //la classe _LoginPageState gestisce lo stato di LoginPage
  final FirebaseAuth _auth =
      FirebaseAuth
          .instance; //servizio di autenticazone di firebase per gestire login , registrzìazione ecc,
  final TextEditingController _emailController =
      TextEditingController(); //controllo email
  final TextEditingController _passwordController =
      TextEditingController(); // controllo password
  String errorMessage = ""; //eventuale messaggio di errore

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = "Login failed. Check email and password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(toolbarHeight: 30, backgroundColor: Colors.cyan),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
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
                height: 570,
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
                        horizontal: 47,
                        vertical: 5,
                      ),
                      child: Text(
                        "Accedi a Scan&Safe",

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
                          labelText: "Email",
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
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "inserisci la tua password",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(errorMessage, style: TextStyle(color: Colors.red)),

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(250, 50),
                        ),
                        onPressed: _login,
                        child: Text("Accedi"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 50, right: 10),
                      child: Row(
                        children: [
                          Text("Non hai un account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage2(),
                                ),
                              );
                            },
                            child: Text(
                              " Registrati",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.cyan),
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
