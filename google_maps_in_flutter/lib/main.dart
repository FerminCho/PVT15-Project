import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_in_flutter/image_handler.dart'; 

Future<void> main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
} 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final Map<String, Marker> _markers = {};
  final LatLng _center = const LatLng(59.334591, 	18.063240);

  Future<void> _onMapCreated(GoogleMapController controller) async {
     Map<String, String> data = {};

    FirebaseFirestore db = FirebaseFirestore.instance;

  final docRef = db.collection("PVT 15").doc("Car location");
    docRef.get().then(
    (DocumentSnapshot doc) {
      data = doc.data() as Map<String, String>;
      // ...
    },
    onError: (e) => print("Error getting document: $e"),//change to log
    );
    
    //var latlang = [59.334591, 18.063240];
    setState(() {
      _markers.clear();
      data.forEach((k, v) {
        var splitter = v.split(',');
        var marker = Marker(
          markerId: MarkerId(k),
          position: LatLng(double.parse(splitter[0]), double.parse(splitter[1])),
          /*infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),*/
        );
        _markers[k] = marker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers.values.toSet(),
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          northeast: const LatLng(59.448099, 18.179115),
          southwest: const LatLng(59.218005, 17.742408)
          ))
        ),
      ),
      
    );
  }
}