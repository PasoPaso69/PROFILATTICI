import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/domain/models/user.dart';

class Homeviewmodel with ChangeNotifier {
  final Utenterepository repository;
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  Homeviewmodel({
    required this.repository,
    required this.firestore,
    required this.auth,
  });
  int _userPoints = 0;
  int get userPoints => _userPoints;
  User? get Utente => auth.currentUser;

  // Recupera i punti dal database per l'utente corrente
  Future<void> fetchUserPoints() async {
    final Utente = auth.currentUser;
    final points = await repository.getuserpoint(Utente!.uid);
    _userPoints = points!;
    notifyListeners();
  }

  Future<void> assegnazionepunti() async {
    final user = auth.currentUser;
    if (user != null && _userPoints != null) {
      final newPoints = _userPoints! + 4;
      await repository.updatepoint(user, newPoints);
      _userPoints = newPoints; // aggiorna il valore locale
      notifyListeners(); // aggiorna subito la UI
    }
  }

  String? _nome;
  String? get nome => _nome;

  Future<String?> fetchUtenteCorrente() async {
    final user = auth.currentUser;
    if (user != null) {
      final _utenteCorrente = await repository.getnome(Utente!.uid);
      _nome = _utenteCorrente;
      notifyListeners();
    }
  }
}
