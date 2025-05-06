
import 'package:flutter_application/data/services/premi_service.dart';
import 'package:flutter_application/domain/models/premi.dart';

class PremiRepository {
  final PremiService service;
  PremiRepository(this.service);

  //chiama un metodo in service per ritornare uno stream di lista di premi
  Stream<List<Premi>> getPremi() => service.getPremiService();



  ///questo metodo in repo chiama un metodo in service perchè ho bisogno dell'intervento diretto di firestore
  Future<void> aggiornaPremio(Premi premio) => service.aggiornaPremioService(premio);
  
  
  
 


  





}