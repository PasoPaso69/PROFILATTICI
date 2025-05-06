import 'package:cloud_firestore/cloud_firestore.dart';


//dichiaro la classe premi con i vari attributi
class Premi {
  final String id;
  final String nome;
  final int prezzo;
  final String descrizione;
  final String foto;
  bool preferito;
  bool acquistato;
  bool catalogo;

  Premi({required this.id,
        required this.nome,
        required this.prezzo,
        required this.descrizione,
        required this.foto,
        required this.preferito,
        required this.acquistato,
        required this.catalogo}); 




  //questa funzione è una factory constructor quindi viene usata per creare una istanza della classe premi a partire da un documento 
  //di firestore. Il documentSnapshot doc (documento di firestore) viene quindi trasformato in oggetto di premi.
  //Il doc.data() restituisce i dati dal documento come mappa, necessario quindi fare casting perchè restituisce un object?
  //Successivamente associa a ogni attributo della classe premi il valore corrispettivo presente nella colonna su firestore assegnando 
  //in caso un valore di default grazie ai ??
  
  factory Premi.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
     return Premi(
      id: doc.id,
      nome: data['Nome'] ?? '',
      prezzo: data['Prezzo'] ?? 0,
      descrizione: data['Descrizione'] ?? '',
      preferito: data['Preferito'] ?? false,
      acquistato: data['Acquistato'] ?? false,
      catalogo: data['Catalogo'] ?? true,
      foto: data['Foto'] ?? 'assets/images/crema.png'
    );
  }
}

