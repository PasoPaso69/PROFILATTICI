import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/backLogout.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/drawer.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/homeAppBar.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/homeBoxDonazione.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/homeBoxPunti.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/homeBoxScan.dart';
import 'package:flutter_application/ui/view/widgets/customBottomNavigationBar.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, this.showToast = false, this.control = false})
    : super(key: key);
  final bool showToast;
  final bool control;

  @override
  Widget build(BuildContext context) {
    //MOSTRA IL TOAST SOLO SE RICHIESTO
    if (control) {
      if (showToast) {
        Future.microtask(() {
          print("ciao");
          Fluttertoast.showToast(
            msg: "Prodotto scannerizzato con successo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        });
      } else {
        Future.microtask(() {
          print("ciao");
          print(control);
          print(showToast);
          Fluttertoast.showToast(
            msg: "Non siamo riusciti a scannerizzare il tuo prodotto",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        });
      }
    }
    return Consumer<Homeviewmodel>(
      builder: (context, viewModel, child) {
        viewModel.fetchUtenteCorrente();
        viewModel.fetchUserPoints();
        return Scaffold(
          backgroundColor: Colors.cyan,
          drawer: const CustomDrawer(), //chiamo il widget drawer
          appBar: Homeappbar(), //chiamo il widget che mi crea l'appbar
          body: Stack(
            children: [
              SizedBox.expand(
                child: Column(
                children: [
                  //chiamo il widget che mi crea il box in alto dei punti
                  Homeboxpunti(),
                  //chiamo il widget che mi crea il box per la scansione
                  
                   Homeboxscan(),

                  //chiamo il widget che mi crea il box per le donazioni
                  Homeboxdonazione(),
                ],
              )
              ),
              const Backlogout(), // widget che mi fa chiudere l'app
            ],
          ),
          // inizio della barra sotto
          //passo al widget l'indice di questa pagina
          bottomNavigationBar: Custombottomnavigationbar(indiceCorrente: 0),
        );
      },
    );
  }
}
