import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/repositories/UtenteRepository.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';
import 'package:flutter_application/ui/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/domain/models/user.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Utenterepository repository;

    return Consumer<Homeviewmodel>(
      builder: (context, viewModel, child) {
        final nome = viewModel.fetchUtenteCorrente();
        final points = viewModel.fetchUserPoints();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${viewModel.nome}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 30),
                IconButton(
                  onPressed: () {
                    print('profilo premuto');
                  },
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    focusColor: Colors.black,
                  ),
                  icon: Icon(Icons.account_circle, size: 40),
                ),
              ],
            ),
            leading: IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.white),
              icon: const Icon(Icons.menu, size: 30), // Icona a 3 linee
              onPressed: () {
                // Apre il Drawer quando l'icona viene premuta
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          backgroundColor: Colors.cyan,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                child: GestureDetector(
                  onTap: () { Navigator.push( context,
                    MaterialPageRoute(builder: (context) => PremiScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 180,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              ' Punti    : ${viewModel.userPoints} pt',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Icon(Icons.card_giftcard, size: 80),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                child: GestureDetector(
                  onTap: () {
                    MaterialPageRoute(builder: (context) => BenvenutoPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 170,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 270,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(
                              ' Scannerizza subito il tuo prodotto',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment(0.8, 1.5),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.qr_code_scanner, size: 80),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25),
                child: GestureDetector(
                  onTap: () {
                    MaterialPageRoute(builder: (context) => BenvenutoPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 163,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 290,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Text(
                              ' Effettua una donazione, basta un click',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment(0.5, 1.5),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.group, size: 80),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
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
                              builder: (context) => BenvenutoPage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/images.png',
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
                              builder: (context) => BenvenutoPage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/images.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Mappa',
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
                              builder: (context) => BenvenutoPage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/images.png',
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
                              builder: (context) => BenvenutoPage(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/images.png',
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
              ),
            ],
          ),
        );
      },
    );
  }
}
