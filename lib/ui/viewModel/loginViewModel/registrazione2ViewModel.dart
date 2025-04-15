import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';

class Register2pageViewModel with ChangeNotifier{
  final Utenterepository repository;
  Register2pageViewModel(this.repository);
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController nazionalitaController = TextEditingController();
  final TextEditingController indirizzoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();


/*
  @override
  void dispose() {
    super.dispose();
    nomeController.dispose();
    cognomeController.dispose();
    nazionalitaController.dispose();
    indirizzoController.dispose();
    telefonoController.dispose();
    */
  }
