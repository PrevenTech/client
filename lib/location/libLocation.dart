import 'package:preven_tech/misc/fileManager.dart';

class LocationRegistry {
  static bool ready = false;
  static List<Map<dynamic, dynamic>> _locations = [];
  static List<dynamic> get locations => LocationRegistry._locations;
  static Map<dynamic, dynamic> get lastLocation =>
      LocationRegistry._locations[LocationRegistry._locations.length];
  static addLocation(Map<dynamic, dynamic> loc) async {
    LocationRegistry._locations.add(loc);
    await FileManager.writeFile(LocationRegistry._locations, LOCATION_REGISTRY);
  }
  static init() async {
    var data = await FileManager.readFile(LOCATION_REGISTRY);
    print('LocationRegistry initialied');
    LocationRegistry._locations = data['status'];
    LocationRegistry.ready = true;
  }
}
