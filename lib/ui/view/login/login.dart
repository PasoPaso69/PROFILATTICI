import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/auth_facebook_repository.dart';
import 'package:flutter_application/data/repositories/auth_google_repository.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/login/registrazione.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
        create:
            (_) =>
                LoginPageViewModel(Auth_repository(), AuthFacebookRepository()),
        child: const _LoginPageState(),
      ),
    );
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
      //body: Flexible(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
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
                  height: MediaQuery.of(context).size.height * 0.9,
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
                          horizontal: MediaQuery.of(context).size.width * 0.12,
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
                                    builder: (context) => HomeView(),
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
                              alignment: Alignment.centerRight,

                              fit: BoxFit.contain,
                            ),
                            TextButton(
                              onPressed: () async {
                                await viewModel.loginWithFacebook();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/10464408.png',
                                fit: BoxFit.contain,

                                alignment: Alignment.center,
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
                            "---------------- oppure ----------------",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
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
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.01,
                        ),
                        child: TextField(
                          controller: viewModel.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Inserisci la tua password",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        viewModel.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Non hai un account?"),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    //);
  }
}
