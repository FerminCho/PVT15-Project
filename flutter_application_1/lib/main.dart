import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'plate_recogniser/PlateData.dart';
import 'plate_recogniser/PlateRecogniser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


// Plate recogniser
Future<PlateData> getPlateData() async {
  final response = await http.get(Uri.parse(apiUri));

  if (response.statusCode == 200) {
    return PlateData.fromJson(jsonDecode(response.body));
  
  } else {
    throw Exception("Failed to load plate data.");
  }
}



void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(59.334591, 	18.063240);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late Future<PlateData> futurePlateData;

  @override
  void initState() {
    super.initState();
    futurePlateData = getPlateData();
  }

  @override
  Widget build(BuildContext context) {

  FutureBuilder<PlateData> (
    future: futurePlateData,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.value);
      
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      
      return const CircularProgressIndicator();
    },
  );

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
        ),
      ),
    );
  }
}