import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'libLocation.dart';

class LocationTracker {
  int mode = 0;  // 0: Address based, 1: Distance based
  LocationTracker.useMode(int mode) {
    if (mode > 1 || mode < 0) return;
    this.mode = mode;
  }
  static final List<Position> positions = <Position>[];
  // TODO: Add time checks (5 min) before logging a location
  static const LocationOptions locationOptions =
          LocationOptions(accuracy: LocationAccuracy.best,);
      static final Stream<Position> positionStream =
          Geolocator().getPositionStream(locationOptions);
      StreamSubscription<Position> _positionStreamSubscription = positionStream.listen(
          (Position position) {
            positions.add(position);
            //print(position.toString());
          });
  
}