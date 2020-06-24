import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'libLocation.dart';

Future<bool> isInfected() async {
  bool isTrue = false;
  var cases = await Firestore.instance
      .collection('cases')
      .getDocuments()
      .then((snap) async {
    for (int i = 0; i < snap.documents.length; i++) {
      for (int j = 0; j < snap.documents[i]['locations'].length; j++) {
        var prePos = {
          'latitude': snap.documents[i]['locations'][j]['latitude'],
          'longitude': snap.documents[i]['locations'][j]['longitude']
        };
        Position position = Position.fromMap(prePos);
        for (int k = 0; k < LocationRegistry.locations.length; k++) {
          var pos = LocationRegistry.locations[k];
          var distance = await Geolocator()
              .distanceBetween(position.latitude, position.longitude,
                  pos['latitude'], pos['longitude'])
              .then((dist) {
            if (dist <= 20) {
              isTrue = true;
            }
          });
        }
      }
    }
  });
  return isTrue;
}
