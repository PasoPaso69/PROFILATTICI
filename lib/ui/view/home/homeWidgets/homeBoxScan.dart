import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/Scan/scanview.dart';

class Homeboxscan extends StatelessWidget {
  const Homeboxscan({super.key});

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
              MaterialPageRoute(builder: (context) => Scanview()),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      'Scansiona subito il tuo prodotto!',
                      softWrap: true,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1.9),
                  child: Image.asset(
                    'assets/images/icons8-qr-code-64.png',
                    scale: 0.8,
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
