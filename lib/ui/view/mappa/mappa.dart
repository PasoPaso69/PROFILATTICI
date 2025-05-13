import 'package:flutter/material.dart';
import 'package:flutter_application/ui/view/home/homeview.dart';
import 'package:flutter_application/ui/view/mappa/barraDiRicerca.dart';
import 'package:flutter_application/ui/view/widgets/customBottomNavigationBar.dart';
import 'package:flutter_application/ui/viewModel/mappaViewModel/mappa_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

//dal momento che voglio che i permessi vengano chiesti subito deve renderla stateful
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  //creo lo stato
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  @override
  void initState() {
    //inizializzo lo stateful widget 
    super.initState();
    // Appena il widget è stato inizializzato chiamo la funzione nel viewmodel cosi da chiedere i permessi
    Future.microtask(() async {
      final viewmodel = context.read<MapViewModel>();
      await viewmodel.loadCurrentLocation();
      await viewmodel.caricaMarkerFarmacie();      
    });
  }

  @override
  Widget build(BuildContext context) {
    //uso popscope perchè cosi gestisco meglio le manovre di "indietro"
    return PopScope(
      //annullo il valore di default del pulsanti indietro
      canPop: false,
      //quando clicco indietro vado nella home
      onPopInvokedWithResult: (didpop, result) async {
        if(!didpop){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeView()));
        }
      },   
    child: Scaffold(
      appBar: AppBar(title: Text("MAPPA"), centerTitle: true, backgroundColor: Colors.cyan, titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      body: Consumer<MapViewModel>(
        
        builder: (context, vm, child) {
          if (vm.currentLocation == null) {
            return Center(child: CircularProgressIndicator());
          }

          final position = vm.currentLocation!;
          return Stack(
            
            children: [
          GoogleMap(
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14,
            ),
            myLocationEnabled: true,
            markers: vm.markerFarmacie.toSet(), //permette di vedere i marker
          ),

          //barra di ricerca in alto
           Positioned(
            top: 10,
            left: 10,
            child: Barradiricerca(),
            )          
            ]
          );          
        },
      ),
      //chiamo la barra di navigazione in basso
      bottomNavigationBar: Custombottomnavigationbar(indiceCorrente: 2),
    )
    );
  }
}
