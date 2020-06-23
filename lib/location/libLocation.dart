import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

/*
class LibLocation {
  // In the json file every value should be a map containing the following keys:
  // -latitude
  // -longitude
  // -timestamp
  LibLocation() {
    _fetchCache();
  }

  List<Position> locations = <Position>[];

  _fetchCache() async {
    Directory dir = await getApplicationDocumentsDirectory().then((apdir) {
      File cache = File(apdir.path + '/locationCache.json');
      cache.exists().then((bool exists) {
        if (exists == false) {
          cache.createSync();
        }
        // cache.readAsString().then((contents) {
        //  var cnt = json.decode(contents);
        //  cnt.forEach((v) {
        //    this.locations.add(Position.fromMap(v));
        //  });
        // });
      });
    });
  }

  _updateCache(Map<dynamic, dynamic> val) async {
    Directory dir = await getApplicationDocumentsDirectory().then((apdir) {
      File cache = File(apdir.path + '/locationCache.json');
      List<dynamic> contents = json.decode(cache.readAsStringSync());
      contents.add(val);
      cache.writeAsStringSync(json.encode(contents));
    });
  }

  Future<bool> addLocation(Position loc) async {
    this.locations.add(loc);
    Map<dynamic, dynamic> toAdd = {
      'latitude': loc.latitude,
      'longitude': loc.latitude,
      'timestamp': loc.timestamp
    };
    await _updateCache(toAdd);
    return true;
  }
}
final LibLocation libLocation = LibLocation();
*/

class LocationRegistry {
  static List<Map<dynamic, dynamic>> _locations = [];
  static List<dynamic> get locations => LocationRegistry._locations;
  static Map<dynamic, dynamic> get lastLocation =>
      LocationRegistry._locations[LocationRegistry._locations.length];
  static addLocation(Map<dynamic, dynamic> loc) {
    LocationRegistry._locations.add(loc);
    //LocationRegistry._updateCache(loc);
  }

  static _fetchCache() async {
    List<Map<dynamic, dynamic>> toret;
    Directory dir = await getApplicationDocumentsDirectory().then((apdir) {
      File cache = File(apdir.path + '/locationCache.json');
      cache.exists().then((bool exists) {
        if (exists == false) {
          cache.createSync();
          cache.writeAsStringSync(json.encode([]));
        }
        cache.readAsString().then((contents) {
          var cnt = json.decode(contents);
          cnt.forEach((v) {
            toret.add(v);
          });
        });
      });
    });
    if (toret != null) {
      return toret;
    }
    else {
      return [];
    }
  }

  static _updateCache(Map<dynamic, dynamic> val) async {
    Directory dir = await getApplicationDocumentsDirectory().then((apdir) {
      File cache = File(apdir.path + '/locationCache.json');
      List<dynamic> contents = json.decode(cache.readAsStringSync());
      contents.add(val);
      cache.writeAsStringSync(json.encode(contents));
    });
  }
}
