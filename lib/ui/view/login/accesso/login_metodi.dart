import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/viewModel/loginViewModel/loginViewModel.dart';
import 'package:provider/provider.dart';

class LoginMetodi extends StatelessWidget {
  const LoginMetodi({super.key});


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginPageViewModel>(context);
  return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.1, 
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
    );

  }
  }