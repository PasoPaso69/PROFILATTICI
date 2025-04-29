
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/data/services/premi_service.dart';
import 'package:flutter_application/domain/models/premi.dart';

class PremiRepository {
  final PremiService service;
  PremiRepository(this.service);

  Stream<List<Premi>> getPremi() => service.getPremiService();



  ///questo metodo l'ho messo perchè mi serve per aggiornare i valori booleani e permettere di spostare un prodotto da preferito a catalogo
  Future<void> aggiornaPremio(Premi premio) async {

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