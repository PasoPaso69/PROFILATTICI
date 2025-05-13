import 'package:flutter_application/data/services/codicivalidiservice.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/domain/models/codicivalidi.dart';

class Codicivalidirepository {
  final Codicivalidiservice service;
  Codicivalidirepository(this.service);

  Stream<List<Codicivalidi>> getCodiciStream() => service.getCodiciStream();

  //CONSENTE DI PRENDERE TUTTI I CODICI VALIDI DA SCANNERIZZARE
  Future<List<String?>> getcodici() => service.getcodici();

  //CONSENTE DI PRENDERE I PUNTI DA ASSEGNARE A UN UTENTE PER UN CODICE SCANNERIZZATO
  Future<int> getpuntiass(codiceabarre) => service.getpuntiass(codiceabarre);
}
