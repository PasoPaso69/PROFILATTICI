import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/domain/models/user.dart';

class Register2pageViewModel with ChangeNotifier {
  final Utenterepository repository;
  Register2pageViewModel(this.repository);
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController nazionalitaController = TextEditingController();
  final TextEditingController indirizzoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  Future<void> salvaUtente() async {
    final nuovoUtente = Utente(
      id: '', // Firestore lo genera
      nome: nomeController.text,
      cognome: cognomeController.text,
      indirizzo: indirizzoController.text,
      nazionalita: nazionalitaController.text,
      telefono: telefonoController.text,
    );
    await repository.addUtente(nuovoUtente);
  }

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
