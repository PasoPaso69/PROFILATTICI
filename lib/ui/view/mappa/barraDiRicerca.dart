import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/mappaViewModel/mappa_viewmodel.dart';
import 'package:provider/provider.dart';

class Barradiricerca extends StatelessWidget {
  const Barradiricerca({super.key});


@override
Widget build(BuildContext context){
  return Consumer<MapViewModel>(
    builder: (context, mapViewModel, child){
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 45,
          decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10),
         border: Border.all(color: Colors.grey, width: 1 )
          ),
         child: TextField(
          onChanged: (query){
            mapViewModel.filtraFarmacie(query);
          },
          decoration: InputDecoration(
          
            hintText: "Cerca una farmacia",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5)
          ),
        ),
      )
        );
    }
      );
    }
  
}


