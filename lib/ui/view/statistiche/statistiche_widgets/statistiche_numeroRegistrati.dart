import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/statisticheViewModel/statistiche_viewmodel.dart';
import 'package:provider/provider.dart';

class StatisticheNumeroregistrati  extends StatelessWidget{
  const StatisticheNumeroregistrati({super.key});



  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<StatisticheViewmodel>(context);
    
   return  StreamBuilder<int>(
        stream: viewmodel.fetchUserCount(), 
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          } else {
            return Center( 
              child: SizedBox(
            width: (MediaQuery.of(context).size.width) /1.1,           
            child: TextButton(onPressed: null, 
            style: TextButton.styleFrom(     
              alignment: Alignment.center,
              backgroundColor: Color(0xFF2F8D88)
            ),
              child: Row( 
                children: [
                  Icon(Icons.people, color: Colors.white),
                  SizedBox(width: 10),
                  Text("Utenti registrati: ",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                   ),
                   Spacer(),
                  Text("${snapshot.data}",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                   ),
                ]
              )
              ),
           )
          );        
          }
        }
        );
  }
}