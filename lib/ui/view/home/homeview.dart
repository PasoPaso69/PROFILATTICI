
import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/benvenuto.dart';
import 'package:flutter_application/ui/view/home/drawer.dart';
import 'package:flutter_application/ui/view/premi/premi_screen.dart';
import 'package:flutter_application/ui/viewModel/homeviewmodel.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Consumer<Homeviewmodel>(
      builder: (context, viewModel, child) {
         viewModel.fetchUtenteCorrente();
         viewModel.fetchUserPoints();
        return Scaffold(
          drawer: const CustomDrawer(),
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
            
            leading: Builder(builder: (context){ return 
            IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.cyan),
              icon: const Icon(Icons.menu, size: 30), // Icona a 3 linee
              onPressed: () {
                print("premuto le barre");
                // Apre il Drawer quando l'icona viene premuta
                Scaffold.of(context).openDrawer();
              },
            );
            }
            )
          ),
          backgroundColor: Colors.cyan,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                 horizontal: MediaQuery.of(context).size.width / 10,
                 vertical: MediaQuery.of(context).size.height / 85),
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
                              'Punti: ${viewModel.userPoints} pt',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width /1000),
                          child: Image.asset('assets/images/icons8-pacco-regalo-64.png', scale: 0.8,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10,
                  vertical: MediaQuery.of(context).size.height / 85),
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
                              horizontal: MediaQuery.of(context).size.width / 10,
                              vertical: 5,
                            ),
                            child: Text(
                              'Scansiona subito il tuo prodotto!',
                              softWrap: true,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment(0, 1.9),
                            child: Image.asset('assets/images/icons8-qr-code-64.png',scale: 0.8, ),
                          ),
                        
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 10,
                  vertical: MediaQuery.of(context).size.height / 85),
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
                              'Effettua una donazione, basta un click!',
                              softWrap: true,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        Stack( children: [
                        Align(
                          alignment: Alignment(0.5, 0.5),
                            child: Image.asset('assets/images/icons8-finanziamenti-comunitari-64.png', scale: 0.85,),
                        )
                        ]
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // inizio della barra sotto 

              SizedBox(height: MediaQuery.of(context).size.height /30),
              Expanded(
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
                              'assets/images/icons8-casa-64 (1).png',
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
                              builder: (context) => BenvenutoPage(),
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
                              'assets/images/icons8-ricompensa-50.png',
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






