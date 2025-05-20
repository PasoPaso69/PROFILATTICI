import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';

class StatisticheViewmodel  extends ChangeNotifier{
  final Utenterepository utenterepository;

  StatisticheViewmodel({required this.utenterepository});

  int userCount = 0;
  
  // Mappa regione -> {'Maschio': count, 'Femmina': count}
  Map<String, Map<String, int>> regioniCount = {};


  ///funzione che chiama la repository per avere il numero di utente registrati
  Stream<int> fetchUserCount() {
    return utenterepository.getnumUtenti();
  }


  //mi crea una sorta di lista dove per ogni regione vi è il numero di utenti registrati
  Stream<Map<String, int>> fetchUtentePerRegione(){
    
    try{
    return utenterepository.getUtente().map((utenti){
     
      final Map<String, int> conteggio = {};

      for (final utente in utenti) {
        
        final regione = utente.regione.trim();
        if (conteggio.containsKey(regione)) {
          
          conteggio[regione] = conteggio[regione]! + 1;
        } else {
          
          conteggio[regione] = 1;
        }
      }
      
      return conteggio;
    }
    );
  }
  catch(e){
    print("Errore durante il recupero degli utenti per regione: $e");
    return Stream.value({});
  }
  }



  Stream<Map<String, Map<String, int>>> getRegionCountStream() {
    return utenterepository.getUtente().map((utenti) {
      final Map<String, Map<String, int>> data = {};

      for (var utente in utenti) {
        final regione = utente.regione.isNotEmpty ? utente.regione : 'Sconosciuta';
        final sesso = utente.sesso.toLowerCase();

        data.putIfAbsent(regione, () => {'Maschio': 0, 'Femmina': 0});

        if (sesso == 'maschio') {
          data[regione]!['Maschio'] = data[regione]!['Maschio']! + 1;
        } else if (sesso == 'femmina') {
          data[regione]!['Femmina'] = data[regione]!['Femmina']! + 1;
        }
      }

      regioniCount = data;
      notifyListeners();

      return data;
    });
  }
  }