import 'package:flutter/material.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/fakeLoginPageViewModel.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';

class LoginEmailandpassword extends StatelessWidget{
  const LoginEmailandpassword({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);
    return Column(
     children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.02,
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
        key: Key("usernameField"),
        controller: viewModel.emailController,
        onChanged: (value) {
            if (viewModel is FakeLoginPageViewModel) {
              viewModel.setEmail(value);
            } else {
              
            }
          },
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
          vertical: MediaQuery.of(context).size.height * 0.02,
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
        child: TextFormField(
          key: Key("passwordField"),
          controller: viewModel.passwordController,
           onChanged: (value) {
            if (viewModel is FakeLoginPageViewModel) {
              viewModel.setPassword(value);
            } else {
              // logica per il viewModel reale
            }
          },
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Inserisci la tua password",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
     ],
     );
    
  }
}