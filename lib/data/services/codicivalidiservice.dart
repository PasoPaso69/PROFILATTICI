import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/models/codicivalidi.dart';

class Codicivalidiservice {
  //FUNZIONE PER RESTITUIRE UNA LISTA CONTINUAMENTE AGGIORNATA DI CODICI
  Stream<List<Codicivalidi>> getCodiciStream() {
    return FirebaseFirestore.instance
        .collection('codici validi')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Codicivalidi.fromFirestore(doc))
                  .toList(),
        );
  }

  //FUNZIONE CHE RESTITUISCE TUTTI I CODICI A BARRE(ATTRIBUTO INTERNO)
  Future<List<String?>> getcodici() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('codici validi').get();
    return querySnapshot.docs
        .map((doc) => doc['codice a barre'] as String)
        .toList();
  }

  //FUNZONE CHE RESTITUISCE I PUNTI DA ASSEGNARE NEL MOMENTO IN CUI VIENE SCANSIONATO QUEL CODICE A BARRE
  Future<int> getpuntiass(String codiceabarre) async {
    final doc =
        await FirebaseFirestore.instance
            .collection('codici validi')
            .where('codice a barre', isEqualTo: codiceabarre)
            .limit(1)
            .get();
    //final querysnapshot = doc.docs.first;
    //return querysnapshot['punti assegnati'] as int;
    if (doc.docs.isNotEmpty) {
      final querysnapshot = doc.docs.first;
      return querysnapshot['punti assegnati'] as int;
    } else {
      // Codice non trovato: puoi restituire 0 o lanciare un’eccezione custom
      print("Codice $codiceabarre non trovato nel DB.");
      return 0;
      // oppure: throw Exception("Codice non trovato");
    }
  }
}
