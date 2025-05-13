/* Questo service serve per recuperare la posizione attuale del dispositivo tramite gps usando plugin geolocator
* 
*
*/
import 'package:geolocator/geolocator.dart';

class MapService {

  ///Definisco una funzione asincrona che restituisce la posizione attuale
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(  //preleva tramite il plugin la posizione dell'utente
      desiredAccuracy: LocationAccuracy.high,   //indica che voglio la massima precisione
    );
  }

  
}
