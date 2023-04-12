import 'package:flutter_application_1/Vehicle.dart';
import 'package:flutter_application_1/VehicleBrand.dart';
import 'package:flutter_application_1/VehicleModel.dart';

import 'User.dart';


class Register {

  Set<User> users = Set();
  Set<VehicleBrand> brands = Set();
  Set<VehicleModel> models = Set();
  Set<Vehicle> vehicles = Set();

  String fileLocation = "[null]";

  // --- USER COLLECTION FUNCTIONS ---

  addUser(User input){
    users.add(input);
  }

  getUser(String inputString) {
    
  }

  // --- BRAND COLLECTION FUNCTIONS ----

  addBrand(VehicleBrand input) {
    brands.add(input);
  }

  getBrand() {

  }

  // --- MODEL COLLECTION FUNCTIONS ---

  addModel(VehicleModel input) {
    models.add(input);
  }

  getModel() {

  }

  // --- VEHICLE COLLECTION FUNCTIONS ---

  addVehicle(Vehicle input) {
    vehicles.add(input);
  }

  getVehicle() {

  }

  // --- FUNCTIONS FOR READING AND WRING DATA ---

  writeData() {

  }

  readData() {

  }

}