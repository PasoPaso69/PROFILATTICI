import 'dart:convert';
import 'package:flutter/services.dart'; // Per caricare file locali
import 'package:flutter_application/domain/models/farmacia.dart';

class FarmaciaService {
  Future<List<Farmacia>> caricaFarmacia() async{

    //carico il json
    try{
    final String filejson = await rootBundle.loadString('assets/json/Distributori-di-farmaci.json');
    

    //decodifico il json
    final data = json.decode(filejson);

    //ritorna una lista con tutte le farmacie come oggetto dal json
     List<Farmacia> farmacie = List<Farmacia>.from(data.map((item)=>Farmacia.fromJson(item)));
     return farmacie;
  } catch (e){
    print("Errore nel caricamento delle farmacie: $e");
    rethrow;
  }
} 
}