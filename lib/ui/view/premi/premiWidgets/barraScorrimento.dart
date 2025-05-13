import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'package:provider/provider.dart';


class Barrascorrimento extends StatelessWidget {
  const Barrascorrimento({super.key});


  @override
  Widget build (BuildContext context){
    final viewmodel = Provider.of<PremiViewmodel>(context);

    //qui inizia la creazione della barra laterale
  return Padding(padding: EdgeInsets.symmetric(horizontal: 15), // spazio laterale per il bottone
      child: Stack(
        children: [
          SizedBox(
     width: double.infinity, // espande il bottone orizzontalmente
    child: TextButton(
      onPressed: null, // Pulsante disabilitato
      style: TextButton.styleFrom(
        backgroundColor: Colors.white, // Colore di sfondo del pulsante
        
      ),
          child: Text("",
          )
          ),
          ),

          // inizia il secondo bottone largo 1/3 tutto a sinistra
          SizedBox(
            width: (MediaQuery.of(context).size.width -30)/3,   //misura la larghezza: massima - 30 del padding, tutto diviso 3
            child: ElevatedButton(onPressed: (){
              viewmodel.catalogo();   //chiama la funzione catalogo della viewmodel
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: viewmodel.mostraCatalogo ? Colors.grey : Colors.white,   //se mostracatalogo è vero, allora il colore è griglio altrimenti è bianco, stesso meccanismo per le righe sottostanti
              side: viewmodel.mostraCatalogo ? BorderSide(color: Colors.grey) : BorderSide.none,
              elevation: viewmodel.mostraCatalogo ? 2.0 : 0
              ),
             child: Text("Catalogo",
             style: TextStyle(
              fontSize: 13,
              color: Colors.black
             ),
             )
             ),

          ),

        //inizio del terzo bottone centrale largo 1/3
        Padding(padding: EdgeInsets.only(left: 110),
          child: SizedBox( 
            width: (MediaQuery.of(context).size.width -30)/3,
            child: ElevatedButton(onPressed: (){
              viewmodel.preferito();   // chiama la funzione preferito della viewmodel
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: viewmodel.mostraPreferito ? Colors.grey : Colors.white,
              side: viewmodel.mostraPreferito ? BorderSide(color: Colors.grey) : BorderSide.none,
              elevation: viewmodel.mostraPreferito ? 2.0 : 0),
             child: Text("Preferiti",
             style: TextStyle(
              fontSize: 13,
              color: Colors.black
             ),
             )
             ),       
        )
          ),

          //inizio dell'ultimo bottone della barra in alto
        Padding(padding: EdgeInsets.only(left: 220),
          child: SizedBox( 
            width: (MediaQuery.of(context).size.width -30)/3,
            child: ElevatedButton(onPressed: (){
              viewmodel.acquistato();  //chiama la funzione acquistato della viewmodel
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: viewmodel.mostraAcquistato ? Colors.grey : Colors.white,
              side: viewmodel.mostraAcquistato ? BorderSide(color: Colors.grey): BorderSide.none,
              elevation: viewmodel.mostraAcquistato ? 2.0 : 0),
             child: Text("Acquistati",
             style: TextStyle(
              fontSize: 13,
              color: Colors.black
             ),
             )
             ),
            )
            )
             ]
          )
            );

  }
}