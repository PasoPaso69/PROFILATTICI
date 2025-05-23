import 'package:flutter/material.dart';
import 'package:flutter_application/domain/models/premi.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/premi/premiWidgets/barraPunti.dart';
import 'package:flutter_application/ui/view/premi/premiWidgets/barraScorrimento.dart';
import 'package:flutter_application/ui/view/premi/premiWidgets/premiAppBar.dart';
import 'package:flutter_application/ui/view/premi/premiWidgets/premiCard.dart';
import 'package:flutter_application/ui/view/widgets/customBottomNavigationBar.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'package:provider/provider.dart';

class PremiScreen extends StatelessWidget{
  const PremiScreen({super.key});

  @override
  Widget build(BuildContext context){

    // è molto importante perchè questo consente di riattivare lo streambuilder (e quindi la chiamata al get premi nella viewmodel)
    // ogni volta che il codice passa per il notifylistener, quindi quando chiamo una qualsiasi funzione come void preferito(), mi
    // aggiorna i booleani e poi grazie al notifylistener mi ripassa per il get premi e quindi mi fa apparire i giusti prodotti
    final viewmodel = Provider.of<PremiViewmodel>(context);
    //gestisco il pulsante "indietro"
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
      //chiamo la classe che costruisce la appbar
      appBar: Premiappbar(),

//--------------------------------------------------------------------------------------------------
      // inizia il body e uso column perchè sono una serie di widget incolonnati
      body: Column(
       children: [ 

        //qua inizio a creare la barra laterale in alto composta da tanti bottoni
       const Barrascorrimento(),
      
       SizedBox(height: MediaQuery.of(context).size.height / 30),   //lascio un po di spazio vuoto

       //chiamo la classe che costruisce la barra dei punti 
       const Barrapunti(),          
  //qui inizio a prendere i dati dal database tramite lo streamBuilder
        Expanded(
          child:
         StreamBuilder<List<Premi>>(   //chiamo il get premi dentro la viewmodel
          stream: viewmodel.premi,
          builder: (context, snapshot){      //lo snapshot è lo "stato"     
            if(snapshot.connectionState==ConnectionState.waiting) {  // se è in waiting fa apparire un circular indicator
            return  Center(child: CircularProgressIndicator());}

            if (!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text('Nessun prodotto disponibile'));}   //appare questa scritta se lo snapshot è vuoto
            final premi= snapshot.data!;
           //ho preso correttamente i dati dal firestore

            return GridView.builder(      //crea una griglia 
              padding: EdgeInsets.all(16),   //spazio al bordo della schermata 
              itemCount: premi.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,      //ci sono due colonne di prodotti
                crossAxisSpacing: 10,    // spazio orizzontale 
                mainAxisSpacing: 10,     // spazio verticale 
                childAspectRatio: 0.8,    // rapporto lunghezza larghezza di solito 0.8 è ottimale 
              ),
              itemBuilder: (context, index) {
                return Premicard(premio: premi[index]);   // analizza ogni premio tramite l'indice e chiama la classe
              }
            );
          },
        )
    ) , 
      ]
      ), 
     // qui chiamo la barra in fondo per spostarsi da una schermata a un'altra
      bottomNavigationBar: Custombottomnavigationbar(indiceCorrente: 4),
    )
    );
  }
}