import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';

class Homeboxdonazione extends StatelessWidget{
  const Homeboxdonazione({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 10,
        vertical: MediaQuery.of(context).size.height / 85,
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 10,
        borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PremiScreen()),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
         // alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.23,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width * 0.05,
                    vertical:
                        MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Text(
                    'Effettua una donazione, basta un click!',
                    softWrap: true,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize:
                          MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment(0.5, 0.5),
                    child: Image.asset(
                      'assets/images/icons8-finanziamenti-comunitari-64.png',
                      scale: 0.85,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}