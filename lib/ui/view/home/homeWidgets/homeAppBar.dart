import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class Homeappbar extends StatelessWidget implements PreferredSizeWidget{
  const Homeappbar({super.key});

 @override
 Widget build (BuildContext context){
  final viewmodel = Provider.of<Homeviewmodel>(context);
  return AppBar(
    backgroundColor: Colors.cyan,
      title: Row(
        
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
          child: Text(
            '${viewmodel.nome}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          )
          ),
          SizedBox(width: 16),
          IconButton(
            onPressed: () { 
            },
            style: IconButton.styleFrom(
              foregroundColor: Colors.white,
              focusColor: Colors.black,
            ),
            icon: Icon(Icons.account_circle, size: 40),
          ),
        ],
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.cyan),
            icon: const Icon(Icons.menu, size: 30), // Icona a 3 linee
            onPressed: () {
              // Apre il Drawer quando l'icona viene premuta
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
  );
 }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


