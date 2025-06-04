import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/statistiche/statistiche_widgets/statisticheAppbar.dart';
import 'package:flutter_application/ui/view/statistiche/statistiche_widgets/statistiche_card.dart';
import 'package:flutter_application/ui/view/statistiche/statistiche_widgets/statistiche_grafico.dart';
import 'package:flutter_application/ui/view/statistiche/statistiche_widgets/statistiche_numeroRegistrati.dart';
import 'package:flutter_application/ui/view/widgets/customBottomNavigationBar.dart';
import 'package:flutter_application/ui/viewModel/statisticheViewModel/statistiche_viewmodel.dart';
import 'package:provider/provider.dart';

class StatisticheView  extends StatelessWidget{
  const StatisticheView({super.key});


  @override
  Widget build(BuildContext context) {

    final viewmodel = Provider.of<StatisticheViewmodel>(context, listen: false);
    return PopScope(
      //annullo il default indietro
      canPop: false,
      //se premo indietro vado nella home
      onPopInvokedWithResult: (didPop, result) async{
        if(!didPop){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeView()));
        }
      },
    child: Scaffold(
      
      backgroundColor: Colors.cyan,
      appBar: Statisticheappbar(), //appbar
      body: SingleChildScrollView(
      child: Column( 
        children: [
         StatisticheNumeroregistrati(),


          SizedBox(height: 15),
   StreamBuilder<Map<String, int>>(
      stream: viewmodel.fetchUtentePerRegione(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return SizedBox(
            
            height: 300,
            
            child: GraficoUtentiPerRegione(dati: snapshot.data!),
          );
        } else {
          return const Center(child: Text("Nessun dato disponibile."));
        }
    
      }
    ),
    SizedBox(height: 10),
         //card che mostra il numero di utenti registrati per regione

        CardRegioniUtenti()
        ]
      ),
      ),
        bottomNavigationBar: Custombottomnavigationbar(indiceCorrente: 1), 
    )   
    );
  }
}