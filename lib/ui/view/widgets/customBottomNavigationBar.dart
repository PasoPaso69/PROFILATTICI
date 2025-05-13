import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/Scan/scanview.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/mappa/mappa.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';

class Custombottomnavigationbar extends StatelessWidget {
  final int indiceCorrente;

  const Custombottomnavigationbar({super.key, required this.indiceCorrente});

  @override
  Widget build(BuildContext context) {
    //uso un container per mettere bordi arrotondati e ombreggiatura
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: Offset(0, -4), // Ombra sopra la barra
          ),
        ],
      ),

      //mi serve così taglia i bordi della bottomnavigationbar
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          //prendo quindi l'indice che la pagina precedente mi ha passato nel momento in cui l'utente clicca l'icona
          currentIndex: indiceCorrente,
          onTap: (index) {
            if (index == indiceCorrente)
              return; //se gli indici sono uguali allora ritorno

            switch (index) {
              //se l'indice è 0 vado alla home
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomeView()),
                );
                break;

              //se l'indice è 1 vado alle statistiche
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => BenvenutoPage()),
                );
                break;

              //se l'indice è 2 vado alla mappa
              case 2:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MapScreen()),
                );
                break;

              //se l'indice è 3 vado alla scansione
              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Scanview()),
                );
                break;

              //se l'indice è 4 vado ai premi
              case 4:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => PremiScreen()),
                );
                break;
            }
          },
          type:
              BottomNavigationBarType
                  .fixed, //li rendo fissi così da poterli modificare
          selectedItemColor:
              Colors.black, //quelli dell'indice li coloro di nero
          unselectedItemColor: Colors.grey, //gli altri sono grigi
          selectedFontSize: 15, //scritte dell'indice sono grandi 15
          unselectedFontSize: 12, //le altre grandi 12
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ), //metto il grassetto a quelli dell'indice
          selectedIconTheme: IconThemeData(
            size: 30,
          ), //ingrandisco le icone selezionate
          backgroundColor: Colors.white, //colore bianco
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: "Statistiche",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined),
              label: "Mappa",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Scan"),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              label: "Premi",
            ),
          ],
        ),
      ),
    );
  }
}
