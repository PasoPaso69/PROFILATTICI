import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:provider/provider.dart';

class Registrazione2Sesso extends StatelessWidget{
  const Registrazione2Sesso({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Register2pageViewModel>(context);
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
              "Sesso",
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
                vertical: MediaQuery.of(context).size.height * 0.005,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              child: DropdownButton<String>(
                hint: Text(
                  'Seleziona sesso',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withValues(alpha: 0.4),
                  ),
                ),
                value:
                    [
                          'Maschio',
                          'Femmina',
                        ].contains(viewModel.sessoController.text)
                        ? viewModel.sessoController.text
                        : null,
                items:
                    ['Maschio', 'Femmina'].map((String Value) {
                      return DropdownMenuItem<String>(
                        value: Value,
                        child: Text(
                          Value,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  viewModel.setSesso(value!);
                },
                isExpanded: true,
            underline: SizedBox(),
              )
            )
          ]           
        );
      }
 }
