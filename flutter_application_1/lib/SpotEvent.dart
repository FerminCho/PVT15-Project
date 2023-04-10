import 'dart:html';

import 'package:flutter_application_1/Vehicle.dart';

import 'User.dart';
import 'Location.dart';

class SpotEvent {
  User user = new User("[no name]", "[no email]");
  Vehicle vehicle = new Vehicle("[no ID]");
  DateTime timeStamp = DateTime(0); // <-- felimplementerat
  Location location = Location(0, 0);

}