import 'package:flutter/material.dart';
import 'package:flutter_application/domain/models/premi.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';
import 'package:flutter_application/ui/viewModel/premiViewModel/premi_viewmodel.dart';
import 'package:provider/provider.dart';



//uso uno stateful perchè ho bisogno dell'apparizione della scritta di errore in caso non avessi tutti i punti
class Premicard extends StatefulWidget{
  final Premi premio; //dati del premio

  const Premicard({super.key, required this.premio});
  @override
  State<Premicard> createState() => _PremicardState();
}

class _PremicardState extends State<Premicard> {
  bool controlloPunti = false;
  @override
  Widget build (BuildContext context){
    final viewmodel = Provider.of<PremiViewmodel>(context);  //mi connetto al viewmodel dei premi
    final homeviewmodel = Provider.of<Homeviewmodel>(context);  //mi connetto al viewmodel della home 
    return InkWell(
       //rende le card premibili
       onTap: (){
        showDialog(    //apre una schermata in rilievo come per la stella
          context: context,
          builder: (BuildContext context){
            return StatefulBuilder(builder: (context, setStateDialog)=>AlertDialog(  //rende l'alertdialog stateful                       
              backgroundColor: Colors.white,  
              content: SingleChildScrollView(
              child: Column(            //incolonna i widget 
                children: [
                  ClipRRect(    //primo widget ovvero la foto
                  borderRadius: BorderRadius.circular(20),
                  child: 
                    Image.asset(
                    widget.premio.foto,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    ),                    
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,), //spazio tra la foto e il secondo widget
                  Row(            //usa la row perchè il secondo widget è combinazione di più in orizzontale
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [               //secondo widget
                      Text(widget.premio.nome, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),                     
                    ],
                  ), 
                  Row(       //attributo descrizione
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ SizedBox( 
                      width: MediaQuery.of(context).size.width /1.7,
                      child: 
                      Text(widget.premio.descrizione, 
                      softWrap: true,
                      style: TextStyle(),),
                    )
                    ],
                  ),
                  
                  SizedBox( height: MediaQuery.of(context).size.height *0.05,),
                
                  Row(            //attributo del prezzo
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [               
                      Text("Prezzo:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('${widget.premio.prezzo} pt',  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan, fontSize: 20), ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                  
                  if (widget.premio.acquistato == false)...[  //questo if con lo spread operatore permette di fare condizioni quando uso liste di widget
                    Text("Sei sicuro di volere acquistare questo prodotto?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    textAlign: TextAlign.center,) 
                  ],
                  //questo if permette di far apparire la scritta di errore (punti insufficienti) se controllopunti è vera
                  if(controlloPunti)...[ 
                    SizedBox(height: MediaQuery.of(context).size.height / 100),
                    Text("Spiacente, sembra che non hai abbastanza punti...", style: TextStyle(color: Colors.red, fontSize:10),
                    textAlign: TextAlign.center,
                    )
                  ]
                ],
              ),
              ),
              actions: [
                //come prima uso l'if con lo spread operatore in quanto devo verificare una condizione su una lista di widget
                if (widget.premio.acquistato == false)...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        ElevatedButton(onPressed: () { 

                          //quando premo il bottone annulla metto controllopunti a false cosi cancello la riga di errore in rosso
                          setStateDialog((){
                            controlloPunti = false;
                          });
                          Navigator.of(context).pop();  //torna alla schermata precedente                         
                          }, 
                          style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.cyan,
                          
                          ),
                          child: Text("Annulla"),
                          
                          ),

                          ElevatedButton(onPressed: () async{
                            
                            // chiamo la funzione in homeviewmodel passando il prezzo del premio e i punti dell'utente corrente
                            // cio mi consente di controllare se i punti sono sufficienti all'acquisto del prodotto
                            bool risultato = await homeviewmodel.aggiornamentoPunti(widget.premio.prezzo, homeviewmodel.userPoints);
                            
                            //quindi se i punti sono sufficienti entra dentro il ramo dell'if positivo
                           if(risultato){                     
                          viewmodel.mettoNegliAcquistati(widget.premio); //chiama metodo per mettere un prodotto in acquistati
                          Navigator.of(context).pop();   } //torna alla schermata precedente

                          //se i punti sono insufficienti aggiorno lo stato e metto controllopunti a vero cosi da far apparire la scritta
                          else{
                            setStateDialog((){
                              controlloPunti = true;
                            });
                          }
                          
                          }, style: ElevatedButton.styleFrom(  //bottone di conferma operazione
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.cyan,  //colore bottone
                          foregroundColor: Colors.white  //colore scritta
                          ),
                          child: Text("Conferma")
                          )
                        ]
                )
              ],
              ]
            )
            );
            }
            );
        },
      child:  Card(      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),  // i bordi sono circolari di ogni card 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, //permette la larghezza massima
          children: [
            Expanded(child: Stack(
              children: [
                Positioned.fill(
                child: ClipRRect(     //occupa tutta la larghezza massima disponibile
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(10), //solo l'angolo in alto a sinistra è circolare
              topRight: Radius.circular(10)//solo l'angolo in alto a destra è circolare
              ), 
              child: Image.asset(widget.premio.foto, fit: BoxFit.cover,),
                )
            ),
            Positioned(        //posiziona la stella
              top: 8,
              left: 8,
              child: GestureDetector(      //la rende pigiabile
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(widget.premio.preferito ? 'Rimuovere dai preferiti ' : 'Aggiungere ai preferiti', //fa apparire la giusta scritta in base al valore premio.preferito
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                      ),
                      content: Text(widget.premio.preferito ?    //fa apparire la giusta frase in base al valore di premio.preferito
                      'Vuoi davvero rimuovere questo prodotto dai preferiti?' :
                      'Vuoi davvero aggiungere questo prodotto ai preferiti?'
                      ),
                      actions: [ Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        TextButton(onPressed: () => Navigator.of(context).pop(), //torna alla schermata precedente
                          child: Text("Annulla", style: TextStyle(color: Colors.cyan),),
                          
                          ),
                          ElevatedButton(onPressed: (){
                      
                          viewmodel.mettoNeiPreferiti(widget.premio);  //chiama mettoneipreferiti cosi da cambiare i valori booleani
                          Navigator.of(context).pop();    //torna alla schermata precedente
                          }, style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,  //colore bottone
                          foregroundColor: Colors.white  //colore scritta
                          ),
                          child: Text("Conferma")
                          )
                        ]
                      )
                      ],
                    );
                  
                  });
                },
                child: Icon(               
                  widget.premio.acquistato ? null :( widget.premio.catalogo ? Icons.star_border : Icons.star),   //fa apparire la giusta stella                 
                  color: Colors.yellow,
                  size: 30,
                ),
              ),
            )
              ]
            )
            ),
            Padding(padding: EdgeInsets.all(8),   //spazio
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //crea lo spazio tra le due scritte nome e punti
              children: [
                Expanded(child: Text(  //expanded permette di prendere tutto lo spazio disponibile cosi spinge l'altro verso destra
                  widget.premio.nome,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis, //aggiungi i punti di sospensione qualore fosse troppo lungo
                  )
                  ),
                  Text("${widget.premio.prezzo} pt",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  )
              ],
            )
            )   
          ]
        ),
      )
      );   
  }
}