import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/data/services/utente_service.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_cognome.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_nome.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_regione.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_sesso.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_telefono.dart';
import 'package:flutter_application/ui/view/login/registrazione2/registrazione2_titolo.dart';
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
                  Registrazione2Titolo(),
                  
                  Registrazione2Nome(),
              
                  Registrazione2Cognome(),
                  Registrazione2Sesso(),
                  Registrazione2Regione(),
                  Registrazione2Telefono(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.05,
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
                            viewModel.regioneController.text.isEmpty ||
                            viewModel.sessoController.text.isEmpty ||
                            viewModel.telefonoController.text.isEmpty) {
                          Text("Tutti i campi sono obbligatori");
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
