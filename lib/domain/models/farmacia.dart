class Farmacia {
  final String id;
  final String comune;
  final String provincia;
  final String regione;
  final double lat;
  final double lng;
  final String indirizzo;
  final String nome;

  Farmacia({required this.id, required this.comune, required this.provincia, required this.regione, required this.lat, required this.lng, required this.indirizzo, required this.nome});
  

   factory Farmacia.fromJson(Map<String, dynamic> json) {
    double parseCoordinate(String coord) {
      // Cerca di parsare la coordinata come double, altrimenti restituisci 0.0
      final parsed = double.tryParse(coord);
      return parsed ?? 0.0;
    }

 
    return Farmacia(
      id: json['ENTITYID'],
      comune: json['COMUNE'],
      provincia: json['PROVINCIA'],
      regione: json['REGIONE'],
      lat: parseCoordinate(json['DO_Y'].toString()),  //richiama la funzione
      lng: parseCoordinate(json['DO_X'].toString()),
      indirizzo: json['INDIRIZZO'],
      nome: json['DENOMINAZIONE'],
    );

  
  
  
}
}
