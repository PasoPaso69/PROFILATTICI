import 'package:flutter_application/data/services/mappa_service.dart';
import 'package:geolocator/geolocator.dart';

class MapRepository {
  final MapService _mapService;

  MapRepository(this._mapService);

  ///chiamo direttamente la funzione del mapservice per ottenere la posizione dell'utente
  Future<Position> fetchCurrentLocation() {
    return _mapService.getCurrentLocation();
  }
}
