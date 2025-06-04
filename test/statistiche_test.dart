

import 'package:flutter_application/domain/models/user.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/statistiche/statistiche_view.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';
import 'package:flutter_application/ui/viewModel/statisticheViewModel/statistiche_viewmodel.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';

import 'mocks.mocks.dart';  // Importa i mock generati

class MockUser extends Mock implements User {
  @override
  String get uid => 'uid_non_null';
}

void main() {
  late MockFirebaseAuth mockAuth;
  late MockFirebaseFirestore mockFirestore;
  late MockUtenteService mockUtenteService;
  late MockUtenterepository mockUtenteRepository;
  late MockLoginPageViewModel mockLoginViewModel;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockFirestore = MockFirebaseFirestore();
    mockUtenteService = MockUtenteService();
    mockUtenteRepository = MockUtenterepository();
    mockLoginViewModel = MockLoginPageViewModel();
    final utentiDiTest = <Utente>[
  Utente(nome: 'Mario', cognome: 'Rossi', id: '', point: 876, regione: '', sesso: '', telefono: ''),
  // altri utenti se vuoi
];
    final streamUtentiDiTest = Stream.value(utentiDiTest).asBroadcastStream();

    

     when(mockAuth.currentUser).thenReturn(MockUser());
     when(mockUtenteRepository.getnome('uid_non_null'))
    .thenAnswer((_) async => 'Mario Rossi');  // o quello che vuoi restituire

when(mockUtenteRepository.getuserpoint('uid_non_null'))
    .thenAnswer((_) async => 100);  // o il valore che vuoi restituire
    when(mockUtenteRepository.getcognome(any))
    .thenAnswer((_) async => 'Rossi');  // o un cognome di prova
    when(mockUtenteRepository.getUtente())
  .thenAnswer((_) => streamUtentiDiTest);
 when(mockUtenteRepository.getnumUtenti())
  .thenAnswer((_) => Stream<int>.value(42).asBroadcastStream());




    // Esempio: quando viene chiamato getUtente(), restituisci un valore mock
    // quando(mockUtenteRepository.getUtente()).thenAnswer((_) async => mockUtente);
    // Aggiungi qui i tuoi when necessari per non far crashare i viewmodel
  });

  testWidgets('Tap su Statistiche naviga a StatisticheView', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Homeviewmodel(
              repository: mockUtenteRepository,
              firestore: mockFirestore,
              auth: mockAuth,
            ),
          ),
          Provider<UtenteService>(create: (_) => mockUtenteService),
          ProxyProvider<UtenteService, Utenterepository>(
            update: (_, service, __) => mockUtenteRepository,
          ),
          ChangeNotifierProxyProvider<Utenterepository, StatisticheViewmodel>(
            create: (_) => StatisticheViewmodel(utenterepository: mockUtenteRepository),
            update: (_, repo, __) => StatisticheViewmodel(utenterepository: repo),
          ),

          // IMPORTANTISSIMO: Aggiungi il LoginPageViewModel mockato, per evitare ProviderNotFound
          ChangeNotifierProvider<LoginPageViewModel>(
            create: (_) => mockLoginViewModel,
          ),
        ],
        child: MaterialApp(home: Scaffold(
           body: SizedBox(
          width: 400, // larghezza fissa
          height: 800, // altezza fissa
        child: HomeView(),),),
      ),
      ),);    

    for (int i = 0; i < 10; i++) {
  await tester.pump(const Duration(milliseconds: 100));
}


    final statisticheIcon = find.byKey(const Key('statisticheIcon'));
    expect(statisticheIcon, findsOneWidget);

    await tester.tap(statisticheIcon);
    for (int i = 0; i < 10; i++) {
  await tester.pump(const Duration(milliseconds: 100));
}


    expect(find.byType(StatisticheView), findsOneWidget);
  });
}


