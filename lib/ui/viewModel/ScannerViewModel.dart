import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/codicivalidirepository.dart';

class scannerviewmodel with ChangeNotifier {
  final Codicivalidirepository repository;
  final Utenterepository repository2;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  scannerviewmodel({
    required this.repository,
    required this.firestore,
    required this.auth,
    required this.repository2,
  });
  TextEditingController scancodeController = TextEditingController();
  String Scancodes = '';
  bool verifica = false;
  //final int _userPoints;
  //int get userPoints => _userPoints;
  User? get utente => auth.currentUser;
  Future<void> StartScan(code) async {
    
    Scancodes = code;
    print(Scancodes);
    notifyListeners();
  }

  //CON QUESTA FUNZIONE NOI CONFRONTIAMO IL CODICE A ABRRE SCANSIONATO CON QUELLI NEL DATABASE E SE CORRISPONODO AGGIUNGIAMO PUNTI
  Future<List<String?>> fetchCodici(code) async {
    
    print(code + "asss");
    final List<String?> codici = await repository.getcodici();
    final points = await repository.getpuntiass(code);

    if (codici.contains(code)) {
      verifica = true;
      print(code);
      final User = auth.currentUser;
      final currentPoints = await repository2.getuserpoint(User!.uid);
      final newpoints = currentPoints! + points;
      await repository2.updatepoint(User, newpoints);
      print("Abbiamo fatto");
      notifyListeners();
    } else {
      verifica = false;
      
      notifyListeners();
    }
    return codici;
  }
}
