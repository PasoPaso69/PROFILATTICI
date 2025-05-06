
import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});


@override
Widget build(BuildContext context) {
  
  // mi serve la homeviewmodel per riuscire a prelevare i dati necessari dall'utente
  return Consumer<Homeviewmodel>(
      builder: (context, viewModel, child) {
         viewModel.fetchUtenteCorrente();
        

    return Drawer(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      child: ListView(
        children:  [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white,),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Icon(Icons.account_circle, size: 80,), 
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Text("${viewModel.nome} ${viewModel.cognome}" ,style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold,))
              ]
            )
          ),
          ListTile(
            leading: Icon(Icons.account_circle, size: 60,),
            title: Text('Profilo', style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          child: Divider(),
          ),

          SizedBox(height: MediaQuery.of(context).size.height / 70,),


          ListTile(
            leading: Image.asset("assets/images/icons8-notifica-50.png", scale: 0.7,),
            title: Text('Notifiche', style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          child: Divider(),
          ),


          SizedBox(height: MediaQuery.of(context).size.height / 70,),



          ListTile(
            leading: Image.asset("assets/images/icons8-impostazioni-50.png", scale: 0.7,),
            title: Text('Impostazioni', style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          child: Divider(),
          ),


          SizedBox(height: MediaQuery.of(context).size.height / 70,),


          ListTile(
            leading: Image.asset("assets/images/icons8-assistenza-clienti-50.png", scale: 0.7,),
            title: Text('Assistenza', style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          child: Divider(),
          ),


          SizedBox(height: MediaQuery.of(context).size.height / 70,),



          ListTile(
            leading: Image.asset("assets/images/icons8-punto-interrogativo-50.png", scale: 0.7,),
            title: Text('Lo sapevi?', style: TextStyle(fontWeight: FontWeight.bold),),
          ),


          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          child: Divider(),
          ),


          SizedBox(height: MediaQuery.of(context).size.height / 10.5,),

          Container( 
          color: Colors.cyan,
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15, right:MediaQuery.of(context).size.width / 10 ),
          
          child: Row(
          
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("Scan &" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
          Text("Safe" ,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
            ]
          ),

          Spacer(),

          Image.asset("assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png", scale: 7,)
          ]
          )
          )





        ],
      ),
    );
  
  }
  );
  
}
}