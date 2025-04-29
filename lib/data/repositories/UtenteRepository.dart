import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/domain/models/user.dart';

class Utenterepository {
  final UtenteService service;
  Utenterepository(this.service);

  Stream<List<Utente>> getUtente() => service.getUtenteStream();
  Future<void> addUtente(Utente utente) => service.addUtente(utente);
  Future<void> updatepoint(User? utente, int newpoint) =>
      service.updatepoint(utente, newpoint);
  Future<int?> getuserpoint(String id) => service.getuserpoint(id);
  Future<String?> getnome(String id) => service.getnome(id);
  Future<Utente?> getUtenteCorrente(String id) => service.getUtenteCorrente(id);
}
