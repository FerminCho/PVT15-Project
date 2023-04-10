import 'VehicleBrand.dart';

class VehicleModel {
  String name = "";
  VehicleBrand brand = new VehicleBrand("[no name]");

  VehicleModel(VehicleBrand brand, String name) {
    this.name = name;
    this.brand = brand;
  }

}