import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';

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