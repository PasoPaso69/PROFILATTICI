import 'package:flutter/material.dart';

class Register2pageViewModel with ChangeNotifier{
    final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController nazionalitaController = TextEditingController();
  final TextEditingController indirizzoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();



  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    cognomeController.dispose();
    nazionalitaController.dispose();
    indirizzoController.dispose();
    telefonoController.dispose();
  }
}