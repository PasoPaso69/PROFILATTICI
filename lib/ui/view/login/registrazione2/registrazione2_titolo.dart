import 'package:flutter/material.dart';

class Registrazione2Titolo extends StatelessWidget{
  const Registrazione2Titolo({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Text(
        textAlign: TextAlign.center,
        "Registrati a Scan&Safe",

        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.width * 0.07,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}