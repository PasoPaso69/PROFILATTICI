import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazioneViewModel.dart';
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
        ChangeNotifierProvider(create: (_) => LoginPageViewModel()),
        ChangeNotifierProvider(create: (_)=> RegisterPageViewModel())
        // altri ViewModel globali...
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter login',
        home: BenvenutoPage(),
      ),
    );
  }
}
