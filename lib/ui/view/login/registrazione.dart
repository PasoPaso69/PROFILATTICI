import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/data/services/registrazioneService.dart';
import 'package:flutter_application/ui/view/homeview.dart';
import 'package:flutter_application/ui/view/login/login.dart';
import 'package:flutter_application/ui/view/login/registrazione2.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazioneViewModel.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
        create:
            (_) => RegisterPageViewModel(
              AuthService(),
              Auth_repository(),
              AuthFacebookRepository(),
            ),
        child: const _RegisterPageState(),
      ),
    );
  }
}

class _RegisterPageState extends StatelessWidget {
  const _RegisterPageState();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterPageViewModel>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan, toolbarHeight: 30),
      backgroundColor: Colors.cyan,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
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
                height: MediaQuery.of(context).size.height * 0.95,

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

                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () async {
                              await viewModel.SignOut();
                              await viewModel.loginWithGoogle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registrazione2Page(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/vecteezy_google-logo-transparent-png_42165816.png',
                              fit: BoxFit.contain,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Image.asset(
                            'assets/images/images.png',
                            fit: BoxFit.contain,

                            alignment: Alignment.center,
                          ),
                          TextButton(
                            onPressed: () async {
                              await viewModel.loginWithFacebook();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registrazione2Page(),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/10464408.png',
                              fit: BoxFit.contain,

                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "---------------- Oppure ----------------",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
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
                          textAlign: TextAlign.start,
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
                        vertical: MediaQuery.of(context).size.height * 0.005,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: TextFormField(
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Inserisci la tua mail",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
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
                          "Password",
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

                      child: TextFormField(
                        controller: viewModel.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Inserisci la tua password",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
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
                          "Conferma Password",
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
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.8),

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.001,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: TextFormField(
                        controller: viewModel.confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Inserisci di nuovo la tua password",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Text(
                          viewModel.errormessage,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
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
                          await viewModel.register();
                          if (viewModel.errormessage.isEmpty) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registrazione2Page(),
                              ),
                            );
                          }
                        },
                        child: Text("Procedi"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.001,
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hai già un account?"),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              " Accedi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.cyan,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
