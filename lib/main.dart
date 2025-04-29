import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/premi_repository.dart';
import 'package:flutter_application/data/services/premi_service.dart';
import 'package:flutter_application/data/services/registrazioneService.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazioneViewModel.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Richiesto per Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        Provider(create: (_)=> PremiService()),

        //repository
        ProxyProvider<UtenteService, Utenterepository>(
          update: (_, service, __) => Utenterepository(service),
        ),
        ProxyProvider<PremiService, PremiRepository>(
          update:(_, service, __)=> PremiRepository(service) ),

        //viewmodel
        ChangeNotifierProxyProvider<Utenterepository, Register2pageViewModel>(
          create:
              (_) => Register2pageViewModel(Utenterepository(UtenteService())),
          update: (_, repo, __) => Register2pageViewModel(repo),
        ),

        ChangeNotifierProxyProvider<PremiRepository, PremiViewmodel>(
          create:
              (_) => PremiViewmodel(PremiRepository(PremiService())) ,
              update: (_, repo, __)=> PremiViewmodel(repo),),

        ChangeNotifierProvider(create: (_) => LoginPageViewModel()),
        ChangeNotifierProvider(
          create: (_) => RegisterPageViewModel(AuthService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter login',
        home: BenvenutoPage(),
      ),
    );
  }
}
