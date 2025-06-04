import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:mockito/annotations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';

@GenerateMocks([
  FirebaseAuth,
  FirebaseFirestore,
  UtenteService,
  Utenterepository,
  LoginPageViewModel,
])
void main() {}
