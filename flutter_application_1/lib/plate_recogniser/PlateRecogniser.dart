// License Plate Detection
// Dokumentation finns här: https://rapidapi.com/smartclick-smartclick-default/api/license-plate-detection

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PlateData.dart';

class PlateRecogniser {

 String picture = "/home/axel/Desktop/volvo_car.jpg";
 String apiUri = "https://license-plate-detection.p.rapidapi.com/license-plate-detection";


/* 
Future<http.Response> getPlateData() {
  return http.get(Uri.parse(api_uri));
} 
*/

  Future<PlateData> getPlateData() async {
    final response = await http.get(Uri.parse(apiUri));

    if (response.statusCode == 200) {
      return PlateData.fromJson(jsonDecode(response.body));
    
    } else {
      throw Exception("Failed to load plate data.");
    }
  }
  
}

