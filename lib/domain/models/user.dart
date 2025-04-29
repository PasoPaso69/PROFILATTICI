import 'package:cloud_firestore/cloud_firestore.dart';

class Utente {
  final String id;
  final String nome;
  final String cognome;
  final String sesso;
  final String indirizzo;
  final String telefono;
  final int point;

  Utente({
    required this.id,
    required this.nome,
    required this.cognome,
    required this.indirizzo,
    required this.sesso,
    required this.telefono,
    required this.point,
  });

  factory Utente.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Utente(
      id: doc.id,
      nome: data['nome'],
      cognome: data['cognome'],
      indirizzo: data['indirizzo'],
      sesso: data['sesso'] ?? "Male",
      telefono: data['telefono'],
      point: 0,
    );
  }
}
