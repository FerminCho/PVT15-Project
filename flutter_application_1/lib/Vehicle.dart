
import 'package:flutter_application_1/Color.dart';
import 'package:flutter_application_1/VehicleBrand.dart';
import 'package:flutter_application_1/VehicleModel.dart';


class Vehicle {
  String id = "[no ID]";
  VehicleModel model = VehicleModel(VehicleBrand("[no name]"), "[no name]");
  Color color = Color.UNKNOWN;

  Vehicle (String id) {
    this.id = id;
  }

  setColor(Color input) {
    this.color = input;
  }
}