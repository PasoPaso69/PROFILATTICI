
import 'package:flutter_application/data/services/farmacia_service.dart';
import 'package:flutter_application/domain/models/farmacia.dart';

class FarmaciaRepository {
  final FarmaciaService farmaciaservice;

  FarmaciaRepository( this.farmaciaservice);

  //funziona per richiamare quella del service
  Future<List<Farmacia>> getFarmacie(){
    return farmaciaservice.caricaFarmacia();
  }
  
}