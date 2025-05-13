import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';

class Backlogout extends StatelessWidget{
  const Backlogout({super.key});

  
  


@override
Widget build(BuildContext context) {
  final viewmodel = Provider.of<LoginPageViewModel>(context);
  
  return PopScope(
    canPop: false,   //cambio il normale indietro
    onPopInvokedWithResult: (didPop, result) async{
      if (didPop) return;

      final bool? exit = await showDialog<bool>(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            icon: const Icon(Icons.exit_to_app, size: 40, color: Colors.green),
            elevation: 10,
            title: Text("Conferma uscita", style: TextStyle(fontWeight: FontWeight.bold),),
            content: Text("Sei sicuro di voler uscire?", textAlign: TextAlign.center,),
            backgroundColor: Colors.white,
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), 
                child: Text("Annulla", style: TextStyle(color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),)),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), 
                child: Text("Esci", style: TextStyle(color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),)),
            ],
          );
        }
        );
        if (exit ?? false){
          viewmodel.SignOut();
          viewmodel.SignOutfacebook();
          SystemNavigator.pop();
        }
    }, 
    child: SizedBox.shrink(),

    );
    
  
  }
}