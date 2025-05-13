import 'package:cloud_firestore/cloud_firestore.dart';

class Codicivalidi {
  final String id;
  final String codiceabarre;

  final int pointassegnati;

  Codicivalidi({
    required this.id,
    required this.codiceabarre,

    required this.pointassegnati,
  });

  factory Codicivalidi.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Codicivalidi(
      id: doc.id,
      codiceabarre: data['codice a barre'],
      pointassegnati: data['punti assegnati'],
    );
  }
}
