import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';
import 'package:flutter_application/ui/viewModel/homeViewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class Homeboxpunti extends StatelessWidget{
  const Homeboxpunti({super.key});

  @override
  Widget build (BuildContext context){
    final viewModel = Provider.of<Homeviewmodel>(context);
    final borderRadius = BorderRadius.circular(25);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 10,
        vertical: MediaQuery.of(context).size.height / 85,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 10,
        borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PremiScreen()),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2
            ),
            color: Colors.white,
            borderRadius: borderRadius,
          ),
          //alignment: Alignment.center,

          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.23,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Text(
                    'Punti: ${viewModel.userPoints} pt',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

               Image.asset(
                  'assets/images/icons8-pacco-regalo-64.png',
                  scale: 0.8,
                ),
            ],
          ),
        ),
      ),
      )
    );
  }
}