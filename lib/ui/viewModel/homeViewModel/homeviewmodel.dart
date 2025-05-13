import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';

class Homeviewmodel with ChangeNotifier {
  final Utenterepository repository;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  Homeviewmodel({
    required this.repository,
    required this.firestore,
    required this.auth,
  });
  bool controllo = false;
  int _userPoints = 0;
  int get userPoints => _userPoints;
  User? get utente => auth.currentUser;

  // Recupera i punti dal database per l'utente corrente
  Future<void> fetchUserPoints() async {
    final utente = auth.currentUser;

    final points = await repository.getuserpoint(utente!.uid);

    _userPoints = points!;

    notifyListeners();
  }

  ///questa funzione serve per aggiornare i punti dell'utente ogni volta che acquista un prodotto
  Future<bool> aggiornamentoPunti(puntioggetto, puntiutente) async {
    final user = auth.currentUser;
    if (puntiutente >= puntioggetto) {
      final newPoints = _userPoints - puntioggetto;
      await repository.updatepoint(user, newPoints.toInt());
      _userPoints = newPoints.toInt(); // aggiorna il valore locale
      notifyListeners(); // aggiorna subito la UI
      return true;
    } else {
      return false;
    }
  }

  String? _nome;
  String? get nome => _nome;
  String? _cognome;
  String? get cognome => _cognome;

  // questa funzione nella viewmodel mi consente di prelevare il nome e il cognome dell'utente per poi farli apparire nella view grazie alla chiamata in repo
  Future<void> fetchUtenteCorrente() async {
    final user = auth.currentUser;
    if (user != null) {
      final utenteCorrenteNome = await repository.getnome(utente!.uid);
      final utenteCorrenteCognome = await repository.getcognome(utente!.uid);
      _cognome = utenteCorrenteCognome;
      _nome = utenteCorrenteNome;
      notifyListeners();
    }
  }
}
