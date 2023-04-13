import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  final LatLng _center = const LatLng(59.334591, 	18.063240);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    var positions =  [1];
    var latlang = [59.334591, 18.063240];
    setState(() {
      _markers.clear();
      for (var i in positions) {
        final marker = Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(latlang[0], latlang[1]),
          /*infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),*/
        );
        _markers[i.toString()] = marker;
      }
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