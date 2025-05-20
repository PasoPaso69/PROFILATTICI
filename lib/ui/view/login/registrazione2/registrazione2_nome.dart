import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:provider/provider.dart';

class Registrazione2Nome extends StatelessWidget{
  const Registrazione2Nome({super.key});


  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<Register2pageViewModel>(context);
    return Column(
      children: [  
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nome",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.8),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.005,
          ),
          child: TextFormField(
            textAlign: TextAlign.left,
            controller: viewmodel.nomeController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Inserisci il tuo nome",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        )
      ]
    );
  }
}