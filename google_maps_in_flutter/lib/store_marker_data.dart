import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:native_exif/native_exif.dart';

class StoreMarkeData{


}
      
Future<String?> getLocationDataFromImage(String filePath) async {
  String preciseLocation;
  final exif = await Exif.fromPath(filePath);
  final latLong = await exif.getLatLong();
  await exif.close();
  if (latLong != null) {
    preciseLocation = latLong.latitude.toString() + "," + latLong.longitude.toString();
    return preciseLocation;
  }
  return null;
}