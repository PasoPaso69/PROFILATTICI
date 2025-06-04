import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/login/accesso/login.dart';
import 'package:flutter_application/ui/view/login/registrazione.dart';

class BenvenutoPage extends StatelessWidget {
  const BenvenutoPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //colore della schermata
      backgroundColor: Colors.cyan,

      // parte principale
      body: Center(
        child: Column(
          //allineamento al centro
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/a-logo-with-a-symbol-of-a-condom-wrapped_HHrsD_VvQxq1tx4Fr6DgMQ_XoocHkuZSq6yHJgQDRb4xA-removebg-preview.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.17, // altezza dell'immagine
              ),
            ),

            //scritta principale della schermata
            Container(
              alignment: Alignment.center,
              child: Text(
                "Entra a far parte della community di Scan&Safe ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //scritta secondaria della schermata più piccola della principale
            Container(
              alignment: Alignment.center,
              child: Text(
                "Potrai utilizzare l'app per acquistare, ricevere punti e riscattare fantastici premi!",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

            //spazio
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),

            //pulsante di registrazione
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Center(
                  child: Text(
                    "Registrati",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),

            //spazio tra i pulsanti
           SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //pulsante di accesso
            SizedBox(
              width: 300,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },

                style: TextButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  side: BorderSide(color: Colors.white, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Accedi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
