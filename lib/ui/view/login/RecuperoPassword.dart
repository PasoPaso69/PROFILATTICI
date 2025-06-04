import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/ui/view/login/accesso/login.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';

import 'package:provider/provider.dart';

class Recuperopassword extends StatelessWidget {
  const Recuperopassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
        create:
            (_) =>
                LoginPageViewModel(Auth_repository(), AuthFacebookRepository()),
        child: const _RecuperoPasswordPageState(),
      ),
    );
  }
}

class _RecuperoPasswordPageState extends StatelessWidget {
  const _RecuperoPasswordPageState();
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);
    return PopScope(
      //annullo il valore di default dei pulsanti indietro
      canPop: false,
      //quando clicco torno nella loginPage
      onPopInvokedWithResult: (didpop, result) async {
        if (!didpop) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginPage()),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        //SI PRENDE UNA APPBAR CON UNA FRECCIA CHE TI RIMANDA DIRETTAMENTE ALLA SCHERMATA HOME
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                //ELIMINA LA PILA DI PAGINE APERTE PRIMA E NE APRE UNA NUOVA
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          //TITOLO APPBAR
          title: const Text(
            'RECUPERO PASSWORD',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        backgroundColor: Colors.cyan,

        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                Text(
                  "Inserisci il tuo indirizzo e-mail e ti invieremo le istruzioni per reimpostare per reimpostare la password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontStyle: FontStyle.italic,
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
                      "Email",
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
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextFormField(
                    controller: viewModel.emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Inserisci la tua email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                    horizontal: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      minimumSize: Size(250, 50),
                    ),
                    onPressed:
                        viewModel.isLoading
                            ? null
                            : () async {
                              await viewModel.resetpassword(
                                viewModel.emailController.text,
                              );
                              if (viewModel.errorMessage.isEmpty) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              }
                            },
                    child:
                        viewModel.isLoading
                            ? CircularProgressIndicator()
                            : Text("Reimposta"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
