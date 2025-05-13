import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/login/login.dart';
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
                height: 110,
              ),
            ),

            //scritta principale della schermatar
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Entra a far parte della community di Scan&Safe ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 10),

            //scritta secondaria della schermata più piccola della principale
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Potrai utilizzare l'app per acquistare, ricevere punti e riscattare fantastici premi!",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),

            //spazio
            SizedBox(height: 100),

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

            //spazio
            SizedBox(height: 30),

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
