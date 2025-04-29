import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('utente').doc(userId).set({
      'nome': utente.nome,
      'cognome': utente.cognome,
      'sesso': utente.sesso,
      'indirizzo': utente.indirizzo,
      'telefono': utente.telefono,
      'point': utente.point,
    });
  }

  Future<void> updatepoint(User? utente, newpoint) async {
    await FirebaseFirestore.instance
        .collection('utente')
        .doc(utente!.uid)
        .update({'point': newpoint});
  }

  Future<int> getuserpoint(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('utente').doc(id).get();
    final Utentedb = Utente.fromFirestore(doc);
    return Utentedb.point;
  }

  Future<String> getnome(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('utente').doc(id).get();
    final Utentedb = Utente.fromFirestore(doc);
    return Utentedb.nome;
  }

  Future<Utente?> getUtenteCorrente(String id) async {
    final user = FirebaseAuth.instance.currentUser;

    final doc =
        await FirebaseFirestore.instance.collection('utente').doc(id).get();

    final Utentedb = Utente.fromFirestore(doc);
    return Utentedb;
  }
}
