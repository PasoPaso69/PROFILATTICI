import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeWidgets/backLogout.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/login/RecuperoPassword.dart';
import 'package:flutter_application/ui/view/login/accesso/login_emailAndPassword.dart';
import 'package:flutter_application/ui/view/login/accesso/login_metodi.dart';
import 'package:flutter_application/ui/view/login/registrazione.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   return _LoginPageState();
  }
}

class _LoginPageState extends StatelessWidget {
  const _LoginPageState();
   

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(toolbarHeight: 30, backgroundColor: Colors.cyan),
      body: SingleChildScrollView( //barra di scorrimento per evitare overflow
          child: Column(
            children: [
              SizedBox(
                //immagine del logo
                child: Image.asset(
                  'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              Container(   //container bianco che contiene il form di accesso
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.symmetric( //margini per centralizzare il container
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
                        vertical: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Accedi a Scan&Safe",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const LoginMetodi(), //chiama il widget che contiene i metodi di accesso
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "---------------- oppure ----------------",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const LoginEmailandpassword(), //chiama il widget che contiene il form per la password e l'email
                    //spazio tra il form e il pulsante di accesso
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                     ElevatedButton(  
                        key: Key("loginButton"),
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(250, 50),
                        ),
                        onPressed: (!viewModel.isFormValid || viewModel.isLoading)
                                ? null
                                : () async {
                                  await viewModel.login();
                                  if (viewModel.errorMessage.isEmpty) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeView(),
                                      ),
                                    );
                                  }
                                },
                        child:
                            viewModel.isLoading
                                ? CircularProgressIndicator()
                                : Text("Accedi"),
                      ),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Non hai un account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              " Registrati",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.cyan),
                            ),
                          ),
                        ],
                      ),
                   Padding(  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06,
                    )),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recuperopassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Hai dimenticato la password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.cyan),
                      ),
                    ),
                  ],
                ),
              ),
              const Backlogout(),
            ],
          ),
        ),
      );
  }
}
