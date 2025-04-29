import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/models/premi.dart';

class PremiService {




  Stream<List<Premi>> getPremiService(){
    return FirebaseFirestore.instance
    .collection('premi')
    .snapshots()
    .map((snapshot)=>snapshot.docs.map((doc)=>Premi.fromFirestore(doc)).toList());
    
  }

   
}




