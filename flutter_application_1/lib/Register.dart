import 'package:flutter_application_1/Vehicle.dart';
import 'package:flutter_application_1/VehicleBrand.dart';
import 'package:flutter_application_1/VehicleModel.dart';

import 'User.dart';

class Register {  
  Set<User> users = Set();
  Set<VehicleBrand> brands = Set();
  Set<VehicleModel> models = Set();
  Set<Vehicle> vehices = Set();

  String fileLocation = "[null]";


  // --- USER COLLECTION FUNCTIONS ---
  addUser(User input){
    users.add(input);
  }

  getUser(String inputString) {
    
  }

  // --- BRAND COLLECTION FUNCTIONS ----
  addBrand() {

  }

  getBrand() {

  }

  // --- MODEL COLLECTION FUNCTIONS ---
  addModel() {

  }

  getModel() {

  }

  // --- VEHICLE COLLECTION FUNCTIONS ---
  addVehicle() {

  }

  getVehicle() {

  }

  // --- FUNCTIONS FOR READING AND WRING DATA ---
  writeData() {

  }

  readData() {

  }

}