import 'VehicleBrand.dart';
import 'VehicleType.dart';

class VehicleModel {
  String name = "";
  VehicleBrand brand = new VehicleBrand("[no name]");
  var type = VehicleType.OTHER;

  VehicleModel(VehicleBrand brand, String name) {
    this.name = name;
    this.brand = brand;
  }

}