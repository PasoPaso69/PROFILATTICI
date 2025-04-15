import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/login/login.dart';
import 'package:flutter_application/ui/view/login/registrazione2.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/registrazioneViewModel.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.cyan,
      body: ChangeNotifierProvider(
      create : (_) => RegisterPageViewModel(),
      child : const _RegisterPageState()
      )
    );
    
  }}

    class _RegisterPageState extends StatelessWidget{
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
          //crea una spaziatura uguale dal basso alto destras e sinistra
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
                height: 585,
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
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Registrati a Scan&Safe",

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
                      width: 400,
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
                      padding: EdgeInsets.only(left: 25, top: 23, bottom: 5),
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
                          labelText: "inserisci la tua mail",
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

                      child: TextFormField(
                        controller: viewModel.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "inserisci la tua password",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 25, top: 30, bottom: 5),
                      child: Text(
                        "Conferma Password",
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
                      alignment: Alignment.center,
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
                        controller: viewModel.confirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "inserisci di nuovo la tua password",
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),

                   
                      Align(
                      alignment: Alignment.center,
                       child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1.0,
                          horizontal: 50,
                        ),
                        child: Text(
                          viewModel.errormessage,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                          minimumSize: Size(250, 50),
                        ),
                        onPressed: () async{
                          await viewModel.register();
                          if(viewModel.errormessage.isEmpty){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Registrazione2Page()));
                          }
                        },
                        child: Text("Procedi"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 75, right: 10),
                      child: Row(
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
