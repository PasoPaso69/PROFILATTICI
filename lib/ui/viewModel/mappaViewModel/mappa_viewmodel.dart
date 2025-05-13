import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/farmacia_repository.dart';
import 'package:flutter_application/data/repositories/mappa_repository.dart';
import 'package:flutter_application/domain/models/farmacia.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; 

class MapViewModel with ChangeNotifier {
  final MapRepository mapRepository;
  final FarmaciaRepository farmaciaRepository;

  Position? currentLocation;
  List<Marker> markerFarmacie=[];
  List<Farmacia>? _tutteLeFarmacie;

  MapViewModel(this.mapRepository, this.farmaciaRepository);

  ///carica la posizione attuale dell'utente
  Future<void> loadCurrentLocation() async {
  
    //richiesta dei permessi
    var status = await Permission.location.request();

    if (status.isGranted){
      try{
        currentLocation = await mapRepository.fetchCurrentLocation();
        notifyListeners();
      } catch(e){
        print("Errore nel recupero della posozione: $e");
      }
    } else if(status.isDenied){
      print("Permessi negati");
    }
    
    notifyListeners();
  }


  ///funzione che fa apparire i marker nella mappa 
  Future<void> caricaMarkerFarmacie() async{

    try{
      //recupero le farmacie
      final farmacie = await farmaciaRepository.getFarmacie();

      //memorizzo
      _tutteLeFarmacie = farmacie;

      //creo i marker per ogni farmacia
      markerFarmacie = farmacie.map((farmacia){
        return Marker(
          markerId: MarkerId(farmacia.id),
          position: LatLng(farmacia.lat, farmacia.lng),
          infoWindow: InfoWindow(
            title: farmacia.nome,
            snippet: farmacia.indirizzo
            
          )
        );
      }
      ).toList();
      notifyListeners();
      

    } catch (e){
      print("Errore nel recupero delle farmaice $e");
    }
  }


  ///creo la funzione che mi faccia filtrare le farmacie in base a cio che scrivo sul pulsante di ricerca
  void filtraFarmacie(String query) async{
    if(_tutteLeFarmacie == null) return;
    
  //metto la query tutta minuscolo
    final q = query.toLowerCase();


    //incomincio a filtrare prendendo quindi il comune delle farmacie, mettendolo in minuscolo e poi ritornando solo
    //le farmacie che contengono la query q
    final filtrate = _tutteLeFarmacie!.where((farmacia){
      final comune = farmacia.comune.toLowerCase();
      return comune.contains(q);
    }).toList();



    //aggiorno i marker
     markerFarmacie = filtrate.map((farmacia) {
      return Marker(
        markerId: MarkerId(farmacia.id),
        position: LatLng(farmacia.lat, farmacia.lng),
        infoWindow: InfoWindow(
          title: farmacia.nome,
          snippet: farmacia.indirizzo,
        ),
      );
    }).toList();

    notifyListeners();

  }
}
