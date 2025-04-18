import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/models/user.dart';

class UtenteService {
  Stream<List<Utente>> getUtenteStream() {
    return FirebaseFirestore.instance
        .collection('utente')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Utente.fromFirestore(doc)).toList(),
        );
  }

  Future<void> addUtente(Utente utente) async {
    await FirebaseFirestore.instance.collection('utente').add({
      'nome': utente.nome,
      'cognome': utente.cognome,
      'nazionalita': utente.nazionalita,
      'indirizzo': utente.indirizzo,
      'telefono': utente.telefono,
    });
  }
}
