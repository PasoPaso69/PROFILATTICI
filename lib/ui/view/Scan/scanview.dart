import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/repositories/codicivalidirepository.dart';
import 'package:flutter_application/data/services/codicivalidiservice.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/Scan/manuallyscan.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/viewModel/ScannerViewModel.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class Scanview extends StatelessWidget {
  const Scanview({super.key});

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
        child: const _Scanpagestate(),
      ),
    );
  }
}

class _Scanpagestate extends StatelessWidget {
  const _Scanpagestate();
  @override
  Widget build(BuildContext context) {
    //RICHIAMO VIEWMODEL
    final viewmodel = Provider.of<scannerviewmodel>(context);

    //INIZIO SCAFFOLD
    return Scaffold(
      resizeToAvoidBottomInset: true,

      //SI PRENDE UNA APPBAR CON UNA FRECCIA CHE TI RIMANDA DIRETTAMENTE ALLA SCHERMATA HOME
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              //ELIMINA LA PILA DI PAGINE APERTE PRIMA E NE APRE UNA NUOVA
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
        ),
        //TITOLO APPBAR
        title: const Text(
          'SCANSIONE BARCODE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,

      //VIENE USATO STACK IN MODO TALE CHE LA SCHERMATA SIA A LIVELLI CON PRIMA LA FOTOCAMERA E POI IL CONTAINER CONTENENTE IL MIRINO
      body: Stack(
        children: [
          //QUI INIZIA LO SCANNER
          MobileScanner(
            onDetect: (barcode) {
              final code = barcode.barcodes.first.rawValue;
              if (code != null) {
                // MOSTRA CODICE SCANSIONATO E UNA FRASE DOPO LA SCANSIONE E MESSA DEI PUNTI IN CASO DI SUCCCESSO
                print(code);
                viewmodel.fetchCodici(code);
                print("abbiamo fatto");
              }
            },
          ),

          //INSERIAMO UN CONTAINER CHE VA A CREARE UN MIRINO PER LA SCANSIONE
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyan,
                    width: MediaQuery.of(context).size.longestSide,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // HO POSIZIONATO UN PULSANTE SOTTO PER POTER AVVIARE LA MANUALLYSCAN
          Positioned(
            left: MediaQuery.of(context).size.width * 0,
            right: MediaQuery.of(context).size.width * 0,
            bottom: MediaQuery.of(context).size.width * 0.25,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  elevation: 0,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,

                    builder: (context) => Manuallyscan(),
                  );
                },
                child: Text(
                  "Inserisci manualmente",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
