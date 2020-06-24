import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:preven_tech/location/libLocation.dart';

class Backend {
  static uploadData() {
    var locations = [];
    var userLocations = LocationRegistry.locations;
    userLocations.forEach((element) {
      locations.add({
        'latitude': element
      });
    });
  }
}