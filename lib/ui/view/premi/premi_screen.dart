import 'package:flutter/material.dart';
import 'package:flutter_application/domain/models/premi.dart';
import 'package:flutter_application/ui/view/premi/premiWidget/barraPunti.dart';
import 'package:flutter_application/ui/view/premi/premiWidget/barraScorrimento.dart';
import 'package:flutter_application/ui/view/premi/premiWidget/premiAppBar.dart';
import 'package:flutter_application/ui/view/premi/premiWidget/premiCard.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/ui/view/premi/premiWidget/barraFondo.dart';


class PremiScreen extends StatelessWidget{
  const PremiScreen({super.key});


  @override
  Widget build(BuildContext context){
    final viewmodel = Provider.of<PremiViewmodel>(context);
    
    


    return Scaffold(
        
      backgroundColor: Colors.cyan,
      //chiamo la classe che costruisce la appbar
      appBar: Premiappbar(),

//--------------------------------------------------------------------------------------------------


      // inizia il body e uso column perchè sono una serie di widget incolonnati
      body: Column(
       children: [ 

        //qua inizio a creare la barra laterale in alto composta da tanti bottoni
       const Barrascorrimento(),
      
       SizedBox(height: 20),   //lascio un po di spazio vuoto

       //chiamo la classe che costruisce la barra dei punti 
       const Barrapunti(), 
          
//--------------------------------------------------------------------------------------------------------------------------
  //qui inizio a prendere i dati dal database tramite lo streamBuilder
        Expanded(
          child:
         StreamBuilder<List<Premi>>(
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

                //-----------------------------------------------------------------------------------------------------------
              }
            );
          },
        )
    ) , 

  
    // qui creo la barra in fondo per spostarsi da una schermata a un'altra
    const Barrafondo()
      ]
      )
    );
  }
}