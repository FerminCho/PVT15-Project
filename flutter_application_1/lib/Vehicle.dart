import 'package:flutter_application_1/VehicleBrand.dart';
import 'package:flutter_application_1/VehicleModel.dart';


class Vehicle {
  String id = "[no ID]";
  VehicleModel model = VehicleModel(VehicleBrand("[no name]"), "[no name]");

  Vehicle (String id) {
    this.id = id;
  }
}