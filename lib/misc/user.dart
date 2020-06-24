import 'package:flutter/material.dart';
import 'package:preven_tech/misc/fileManager.dart';
import 'package:geolocator/geolocator.dart';

class User {
  static bool ready = false;
  static ValueNotifier<int> status = ValueNotifier<int>(0);   // 0 normal, 1 yellow, 2 red, 4 green, 5 orange
  static Map<dynamic, dynamic> location = {
    'latitude': 0,
    'longitude': 0
  };
  //static get status => User._status;
  //static set status(int ns) => User._status.value = ns;

  static setStatus(int ns) async {
    User.status.value = ns;
    await FileManager.writeFile(User.toMap(), USER_DATA);
  }

  static init() async {
    var data = await FileManager.readFile(USER_DATA);
    User.status.value = data['status'];
    if (data['latitude'] == 0) {
      Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.best);
      User.location = {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
      await FileManager.writeFile(User.toMap(), USER_DATA);
      User.ready = true;
    } else {
      User.location = data['location'];
      User.ready = true;
    }
  }

  static toMap() {
    return {
      'status': User.status.value,
      'location': {
        'latitude': User.location['latitude'],
        'longitude': User.location['longitude'],
      }
    };
  }
}