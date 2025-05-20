import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/domain/models/user.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Register2pageViewModel with ChangeNotifier {
  final Utenterepository repository;
  Register2pageViewModel(this.repository);
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cognomeController = TextEditingController();
  final TextEditingController sessoController = TextEditingController();
  final TextEditingController regioneController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  Future<void> salvaUtente() async {
    final nuovoUtente = Utente(
      id: '', // Firestore lo genera
      nome: nomeController.text,
      cognome: cognomeController.text,
      regione: regioneController.text,
      sesso: sessoController.text,
      telefono: telefonoController.text,
      point: 0,
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

  void setSesso(String sesso) {
    sessoController.text = sesso;
    notifyListeners();
  }

  //è un modo per poter far si che noi andiamo a definire la modalità con la quale possiamo scrivere un numero di caratteri
  var phonemask = MaskTextInputFormatter(
    mask: "### ### ####",
    filter: {'#': RegExp(r'[0-9]')},
  );

  void setRegione(String regione){
    regioneController.text = regione;
    notifyListeners();
  }
}
