import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:badges/src/badge.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_marker/marker_icon.dart';

import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LatLng _center = const LatLng(59.334591, 	18.063240);
  Map<String, Marker> markers = {};

    bool markInBounds(){
    double lat = 59;
    double lang = 18;
    if(lat > 59.218005 && lat < 59.448099 && lang > 17.742408 && lang < 18.179115){
      return true;
    }
    return false;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    Map<String, String> data = {};

    //FirebaseFirestore db = FirebaseFirestore.instance;

  /*final docRef = db.collection("PVT 15").doc("Car location");
    docRef.get().then(
    (DocumentSnapshot doc) {
      data = doc.data() as Map<String, String>;
      // ...
    },
    onError: (e) => print("Error getting document: $e"),//change to log
    );*/
        var latlang = [59.334591, 18.063240];
          var marker = Marker(
          markerId: const MarkerId("1"),
          //position: LatLng(double.parse(splitter[0]), double.parse(splitter[1])),
          position: LatLng(latlang[0], latlang[1]),
          /*infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),*/
          icon: await MarkerIcon.downloadResizePictureCircle(
            'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
            size: 150,
            addBorder: true,
            borderColor: Colors.black,
            borderSize: 15),
        );
    
      setState(() {
        markers.clear();
        //var splitter = v.split(',');
        markers["1"] = marker;
    });
  }

  @override
  Widget build(BuildContext context){
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
          markers: markers.values.toSet(),
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          northeast: const LatLng(59.448099, 18.179115),
          southwest: const LatLng(59.218005, 17.742408)
          ))
        ),
      ),
      
    );
  }
}