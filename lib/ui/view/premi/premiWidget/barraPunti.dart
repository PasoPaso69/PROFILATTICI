import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class Barrapunti extends StatelessWidget{
  const Barrapunti({super.key});


  @override
  Widget build(BuildContext context){
     final viewmodel = Provider.of<Homeviewmodel>(context);
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: (MediaQuery.of(context).size.width) /1.5,
            child: TextButton(onPressed: null, 

            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF2F8D88)

            ),
              child: Row( 
                children: [
                  Text("I miei punti:               ${viewmodel.userPoints} ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
              )
                ]
              )
              ),
          ),
          );
  }
}

