import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/codicivalidirepository.dart';
import 'package:flutter_application/data/services/codicivalidiservice.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/viewModel/ScannerViewModel.dart';
import 'package:provider/provider.dart';

class Manuallyscan extends StatelessWidget {
  const Manuallyscan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create:
            (_) => scannerviewmodel(
              repository: Codicivalidirepository(Codicivalidiservice()),
              repository2: Utenterepository(UtenteService()),
              firestore: FirebaseFirestore.instance,
              auth: FirebaseAuth.instance,
            ),
        child: const _manuallyscanpagestate(),
      ),
    );
  }
}

class _manuallyscanpagestate extends StatelessWidget {
  const _manuallyscanpagestate();
  @override
  Widget build(BuildContext context) {
    //RICHIAMO IL VIEW MODEL
    final viewmodel = Provider.of<scannerviewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.cyan,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child:
        //HO ACCENTRATO E LASCIATO LO SPAZIO PER QUANDO SI ALZA LA SCHERMATA DAL BASSO PER INSERIRE IL CODICE
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.2,
            ),

            //QUESTO è UN TEXTFORMFIELD PER POTER SCRIVERE MANUALMENTE IL CODICE
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: viewmodel.scancodeController,

                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Inserisci il codice a barre",
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),

                // HO CREATO QUESTA SIDE BOX CON MISURA CHE VARIA IN MODO TALE DA LASCIARE SPAZIO TRA SCRITTA A TEXTFORMFIELD
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                // IL PULSANTE PER POTER INSERIRE IL CODICE MANUALMENTE
                ElevatedButton(
                  onPressed: () {
                    print("${viewmodel.scancodeController.text}");
                    viewmodel.fetchCodici(viewmodel.scancodeController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(showToast: true),
                      ),
                    );
                  },
                  child: Text("Inserisci"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
