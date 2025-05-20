import 'package:cloud_firestore/cloud_firestore.dart';

class Utente {
  final String id;
  final String nome;
  final String cognome;
  final String sesso;
  final String regione;
  final String telefono;
  final int point;

  Utente({
    required this.id,
    required this.nome,
    required this.cognome,
    required this.regione,
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
      regione: data['regione'] ,
      sesso: data['sesso'] ,
      telefono: data['telefono'],
      point: data['point'],
    );
  }
}
