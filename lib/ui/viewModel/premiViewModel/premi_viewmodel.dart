import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/premi_repository.dart';
import 'package:flutter_application/domain/models/premi.dart';

class PremiViewmodel extends ChangeNotifier{
 final Utenterepository repository2;
 final FirebaseFirestore firestore;
  final FirebaseAuth auth;


  
  int _userPoints = 0;
  int get userPoints => _userPoints;
  User? get Utente => auth.currentUser;


  final PremiRepository repository;
  PremiViewmodel({required this.repository, required this.repository2,required this.auth, required this.firestore});

  bool mostraPreferito = false;
  bool mostraAcquistato = false;
  bool mostraCatalogo = true;


 ///permette di far apparire i giusti prodotti nelle loro categorie
  Stream<List<Premi>> get premi {
    return repository.getPremi().map((lista){

      if (mostraPreferito == false && mostraAcquistato == false){
        return lista.where((p)=> p.preferito == false && p.acquistato==false).toList();
      } else if (mostraPreferito == false && mostraAcquistato == true){
        return lista.where((p)=> p.acquistato == true).toList();
      } else if(mostraPreferito == true && mostraAcquistato == false){
        return lista.where((p)=> p.preferito == true && p.acquistato == false).toList();
      } else {
        return lista.toList();
      }
    });
  }

 
 ///permette di mostrare il pulsate preferito e i prodotti
void preferito (){
  mostraPreferito = true;
  mostraCatalogo = false;
  mostraAcquistato = false;
  notifyListeners();
}
   ///permette di mostrare il pulsante catalogo e i prodotti
void catalogo (){
  mostraCatalogo = true;
  mostraAcquistato = false;
  mostraPreferito = false;
  notifyListeners();
}

///permette di mostrare il pulsante acquistato e i prodotti
void acquistato(){
  mostraAcquistato = true;
  mostraCatalogo = false;
  mostraPreferito = false;
  notifyListeners();
}

///cambia i valori booleani di preferito e catalogo e richiama il metodo della repository per poter aggiornare
void mettoNeiPreferiti (Premi premio){
  
  if (premio.catalogo){
    premio.catalogo = false;
    premio.preferito = true;
  } else {
    premio.catalogo = true;
    premio.preferito = false;
  } 

  repository.aggiornaPremio( premio);
  notifyListeners();
}

///cambia i valori booleani di catalogo e acquistato e chiama il metodo della repository per poter aggiornare
void mettoNegliAcquistati(Premi premio){
  premio.catalogo = false;
  premio.acquistato = true;

  repository.aggiornaPremio(premio);
  notifyListeners();
}


Future<void> fetchUserPoints() async {
    final Utente = auth.currentUser;
    final points = await repository2.getuserpoint(Utente!.uid);
    _userPoints = points!;
    notifyListeners();
  }

}