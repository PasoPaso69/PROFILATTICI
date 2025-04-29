
import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/login/registrazione.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';




class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
      create : (_) => LoginPageViewModel(),
      child : const _LoginPageState()
      )
    );
    
  }}


  class _LoginPageState extends StatelessWidget{
    const _LoginPageState();
  
  
  @override

  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(toolbarHeight: 30, backgroundColor: Colors.cyan),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: 570,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 47,
                        vertical: 5,
                      ),
                      child: Text(
                        "Accedi a Scan&Safe",

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/vecteezy_google-logo-transparent-png_42165816.png',
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/images.png',
                            fit: BoxFit.contain,

                            alignment: Alignment.center,
                          ),
                          Image.asset(
                            'assets/images/10464408.png',
                            alignment: Alignment.centerRight,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        textAlign: TextAlign.center,
                        "---------------- oppure ----------------",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.8),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.only(
                        top: 2,
                        bottom: 5,
                        left: 25,
                        right: 25,
                      ),
                      child: TextFormField(
                        controller: viewModel.emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.8),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.only(
                        top: 2,
                        bottom: 5,
                        right: 25,
                        left: 25,
                      ),
                      child: TextField(
                        controller: viewModel.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "inserisci la tua password",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(viewModel.errorMessage, style: TextStyle(color: Colors.red)),

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(250, 50),
                        ),
                        onPressed: viewModel.isLoading ? null : () async{
                          await viewModel.login();
                          if (viewModel.errorMessage.isEmpty){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PremiScreen()));
                            
                          }
                        },
                        child: viewModel.isLoading
                        ? CircularProgressIndicator() 
                        : Text("Accedi"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 50, right: 10),
                      child: Row(
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
  }
}