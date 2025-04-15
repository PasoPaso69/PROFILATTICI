
import 'package:cloud_firestore/cloud_firestore.dart';

class Utente{
  final String id;
  final String nome;
  final String cognome;
  final String nazionalita;
  final String indirizzo;
  final String telefono;


  Utente({required this.id,
         required this.nome, 
         required this.cognome, 
         required this.indirizzo, 
         required this.nazionalita, 
         required this.telefono});

factory Utente.fromFirestore(DocumentSnapshot doc){
  final data = doc.data() as Map<String, dynamic>;
  return Utente(id: doc.id,
                nome: data['nome'],
                cognome: data['cognome'], 
                indirizzo: data ['indirizzo'], 
                nazionalita: data ['nazionalita'],
                telefono: data ['telefono']);
}
}