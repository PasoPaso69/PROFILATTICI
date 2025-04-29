import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/homeview.dart';



class Premiappbar extends StatelessWidget implements PreferredSizeWidget {
  const Premiappbar({super.key});

//questa è la appbar composta dalla freccia e dal titolo
  @override
  Widget build (BuildContext context){
     
    return AppBar(
        backgroundColor: Colors.cyan,   
        automaticallyImplyLeading: false,   //disattiva la freccia di default
        title: Stack(   //uso lo  stack per concatenare freccia a titolo
          children: [
            Align(
              alignment: Alignment.centerLeft,   // allineamento della freccia
         child: IconButton(
          icon: Icon(Icons.arrow_back),    //creazione della freccia
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView()));
         
          },
         ),
            ),
        
         Center(     //titolo
          child: Padding(
            padding: EdgeInsets.all(10),    //spazio per il titolo
        child: Text(
        "PREMI", 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30
          
        ),
        )
          )
      ),
          ]
        ), 
        );
    
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
