import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
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
  Map<String, Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

    bool markInBounds(){
    double lat = 59;
    double lang = 18;
    if(lat > 59.218005 && lat < 59.448099 && lang > 17.742408 && lang < 18.179115){
      return true;
    }
    return false;
  }

    Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition(); 
  }

  Future<void> _onMapCreated() async {
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
        _markers.clear();
        //var splitter = v.split(',');
        _markers["1"] = marker;
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
          onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
            },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers.values.toSet(),
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          northeast: const LatLng(59.448099, 18.179115),
          southwest: const LatLng(59.218005, 17.742408)
          )),
          myLocationEnabled: true,
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());
 
            // marker added for current users location
            _markers['2'] =(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );
 
            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
 
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
      ),
      
    );
  }
}