import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/data/repositories/farmacia_repository.dart';
import 'package:flutter_application/data/repositories/mappa_repository.dart';
import 'package:flutter_application/data/repositories/codicivalidirepository.dart';
import 'package:flutter_application/data/repositories/premi_repository.dart';
import 'package:flutter_application/data/services/farmacia_service.dart';
import 'package:flutter_application/data/services/mappa_service.dart';
import 'package:flutter_application/data/services/codicivalidiservice.dart';
import 'package:flutter_application/data/services/premi_service.dart';
import 'package:flutter_application/data/services/registrazioneService.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/viewModel/ScannerViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazioneViewModel.dart';
import 'package:flutter_application/ui/viewModel/mappaViewModel/mappa_viewmodel.dart';
import 'package:flutter_application/ui/viewModel/statisticheViewModel/statistiche_viewmodel.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Richiesto per Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FacebookAuth.i.isWebSdkInitialized;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //service
        Provider(create: (_) => UtenteService()),
        Provider(create: (_) => PremiService()),
        Provider(create: (_) => MapService()),
        Provider(create: (_) => PremiService()),

        //repository
        ProxyProvider<UtenteService, Utenterepository>(
          update: (_, service, __) => Utenterepository(service),
        ),

        ProxyProvider<PremiService, PremiRepository>(
          update: (_, service, __) => PremiRepository(service),
        ),

        ProxyProvider<MapService, MapRepository>(
          update: (_, service, __) => MapRepository(service),
        ),

        //viewmodel
        ChangeNotifierProxyProvider<Utenterepository, Register2pageViewModel>(
          create:
              (_) => Register2pageViewModel(Utenterepository(UtenteService())),
          update: (_, repo, __) => Register2pageViewModel(repo),
        ),

        ChangeNotifierProvider(
          create:
              (_) => MapViewModel(
                MapRepository(MapService()),
                FarmaciaRepository(FarmaciaService()),
              ),
        ),

        ChangeNotifierProvider(
          create:
              (_) => LoginPageViewModel(
                Auth_repository(),
                AuthFacebookRepository(),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (_) => RegisterPageViewModel(
                AuthService(),
                Auth_repository(),
                AuthFacebookRepository(),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (_) => PremiViewmodel(
                repository: PremiRepository(PremiService()),
                repository2: Utenterepository(UtenteService()),
                firestore: FirebaseFirestore.instance,
                auth: FirebaseAuth.instance,
              ),
        ),
        ChangeNotifierProvider(
          create:
              (_) => scannerviewmodel(
                repository: Codicivalidirepository(Codicivalidiservice()),
                repository2: Utenterepository(UtenteService()),
                firestore: FirebaseFirestore.instance,
                auth: FirebaseAuth.instance,
              ),
        ),

        ChangeNotifierProvider(
          create:
              (_) => Homeviewmodel(
                repository: Utenterepository(UtenteService()),
                firestore: FirebaseFirestore.instance,
                auth: FirebaseAuth.instance,
              ),
        ),

        ChangeNotifierProvider(create: (_)=>StatisticheViewmodel(utenterepository: Utenterepository(UtenteService())))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BenvenutoPage(),
      ),
    );
  }
}
