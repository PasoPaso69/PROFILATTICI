import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/homeview.dart';

import 'package:flutter_application/ui/viewModel/loginViewModel/registrazione2ViewModel.dart';
import 'package:provider/provider.dart';

class Registrazione2Page extends StatelessWidget {
  const Registrazione2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
        create:
            (_) => Register2pageViewModel(Utenterepository(UtenteService())),
        child: const _Register2PageState(),
      ),
    );
  }
}

class _Register2PageState extends StatelessWidget {
  const _Register2PageState();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Register2pageViewModel>(context);

    return Scaffold(
      //colore della schermata
      backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.cyan, toolbarHeight: 30),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Registrati a Scan&Safe",

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

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
                      controller: viewModel.nomeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Inserisci il tuo nome",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cognome",
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
                      controller: viewModel.cognomeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Inserisci il tuo cognome",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
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
                  Consumer<Register2pageViewModel>(
                    builder: (context, viewModel, _) {
                      return Container(
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
                          horizontal: MediaQuery.of(context).size.width * 0.01,
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
                                    'Male',
                                    'Famale',
                                  ].contains(viewModel.sessoController.text)
                                  ? viewModel.sessoController.text
                                  : null,
                          items:
                              ['Male', 'Famale'].map((String Value) {
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
                        ),
                        /*TextFormField(
                      textAlign: TextAlign.left,
                      controller: viewModel.sessoController,
                      decoration: InputDecoration(
                        labelText: "Inserisci il tuo genere",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),*/
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Indirizzo",
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
                      controller: viewModel.indirizzoController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Inserisci il tuo indirizzo",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Telefono",
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
                      controller: viewModel.telefonoController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [viewModel.phonemask],

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Inserisci il numero di telefono",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                        minimumSize: Size(250, 50),
                      ),
                      onPressed: () async {
                        if (viewModel.nomeController.text.isEmpty ||
                            viewModel.cognomeController.text.isEmpty ||
                            viewModel.indirizzoController.text.isEmpty ||
                            viewModel.sessoController.text.isEmpty ||
                            viewModel.telefonoController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Tutti i campi sono obbligatori"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          await viewModel.salvaUtente();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );
                        }
                      },
                      child: Text("Procedi"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
