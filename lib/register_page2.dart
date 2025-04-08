import 'package:flutter/material.dart';
import 'package:flutter_application/home_page.dart';

import 'package:flutter_application/register_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nomecontroller = TextEditingController();
  final TextEditingController _cognomecontroller = TextEditingController();
  final TextEditingController _nazionalitacontroller = TextEditingController();
  final TextEditingController _indirizzocontroller = TextEditingController();
  final TextEditingController _telefonocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //colore della schermata
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(backgroundColor: Colors.cyan, toolbarHeight: 30),
      body: SingleChildScrollView(
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
              height: 690,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Nome",
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
                      controller: _nomecontroller,
                      decoration: InputDecoration(
                        labelText: "inserisci il tuo nome",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Cognome",
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
                      controller: _cognomecontroller,
                      decoration: InputDecoration(
                        labelText: "Inserisci il tuo cognome",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Nazionalità",
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
                      controller: _nazionalitacontroller,
                      decoration: InputDecoration(
                        labelText: "Inserisci la tua nazionalità",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Indirizzo",
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
                      controller: _indirizzocontroller,
                      decoration: InputDecoration(
                        labelText: "Inserisci il tuo indirizzo",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                    child: Text(
                      "Telefono",
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
                      controller: _telefonocontroller,
                      decoration: InputDecoration(
                        labelText: "Inserisci il numero di telefono",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text("Procedi"),
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
