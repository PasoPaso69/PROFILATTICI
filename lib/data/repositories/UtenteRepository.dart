
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/domain/models/user.dart';

class Utenterepository {
  final UtenteService service;
  Utenterepository(this.service);

  Stream<List<Utente>> getUtente() => service.getUtenteStream();

}
