import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      home: LoginPage(), //prima schermata che si vede all apertura
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
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 10),
            Text(errorMessage, style: TextStyle(color: Colors.red)),

            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text("Login")),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text("Dont' have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
