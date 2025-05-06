import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/models/premi.dart';

class PremiService {

  //ritorna uno stream di una lista di premi, usa snapshot per aggiornamenti e converte usando il fromfirestore
  Stream<List<Premi>> getPremiService(){
    return FirebaseFirestore.instance
    .collection('premi')
    .snapshots()
    .map((snapshot)=>snapshot.docs.map((doc)=>Premi.fromFirestore(doc)).toList());
    
  }


   ///tale metodo mi permette di aggiornare i valori booleani dei premi e quindi spostare i prodotti sono la specifica categoria
   Future<void> aggiornaPremioService(Premi premio) async {

    await FirebaseFirestore.instance
    .collection('premi')
    .doc(premio.id)
    .update({
      'Catalogo' : premio.catalogo,
      'Preferito' : premio.preferito,
      'Acquistato' : premio.acquistato
    });

  }

   
}




