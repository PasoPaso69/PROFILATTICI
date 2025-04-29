import 'package:cloud_firestore/cloud_firestore.dart';

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
        required this.catalogo
        
}); 




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

