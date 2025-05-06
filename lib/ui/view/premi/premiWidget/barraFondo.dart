import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';

class Barrafondo  extends StatelessWidget{
  const Barrafondo({super.key});

  

  @override
  Widget build(BuildContext context){
      SizedBox(height: MediaQuery.of(context).size.height /0.3);
              return BottomAppBar(
                color: Colors.cyan,
                padding: EdgeInsets.symmetric(horizontal: 1,vertical: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)
                    ),
                    color: Colors.white,
                  ),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/icons8-casa-64.png',
                              width: 30,
                              height: 30,
                            ),
                            Text('Home', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/icons8-statistica-50.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Statistiche',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/icons8-qr-code-50.png',
                              width: 30,
                              height: 30,
                            ),
                            Text('Scan', style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/icons8-ricompensa-50 (1).png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Premi',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }


}