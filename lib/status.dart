import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'misc/user.dart';
import 'misc/nav.dart';
import 'location/libLocation.dart';
import 'dart:async';

class StatusScreen extends StatefulWidget {
  @override
  createState() => StatusScreenState();
}

class StatusScreenState extends State<StatusScreen> {
  toMap(dynamic loc) {
    var obj = {
      'latitude': loc.latitude,
      'longitude': loc.longitude,
      'altitude': loc.altitude,
      'bearing': loc.bearing,
      'accuracy': loc.accuracy,
      'speed': loc.speed,
      'time': loc.time
    };
    return obj;
  }

  @override
  void initState() {
    const locationOptions =
        LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
    final Stream<Position> positionStream =
        Geolocator().getPositionStream(locationOptions);
    StreamSubscription<Position> _positionStreamSubscription =
        positionStream.listen((Position position) {
      LocationRegistry.addLocation(position.toJson());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    String label = '';
    String desc = '';
    if (User.status == 0) {
      color = Theme.of(context).primaryColor;
      desc = "You haven't been exposed to COVID-19";
      label = 'Normal';
    } else if (User.status == 1) {
      color = Colors.yellow;
      label = "Possible exposure to COVID-19";
      desc =
          "You may have been exposed to COVID-19. Take the necessary precuations and only go out if necessary";
    } else if (User.status == 2) {
      label = "Exposure to COVID-19";
      color = Colors.red;
      desc =
          "You have been exposed to COVID-19. Take the necessary precuations and self isolate";
    } else if (User.status == 3) {
      color = Colors.green;
      label = "Possible Immunity";
      desc = "You are probably immune to COVID-19";
    }
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Status')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: color,
                    width: 6.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image(
                      image: AssetImage('assets/qrCode.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.0),
            OutlineButton(
              onPressed: () {
                print('button pressed');
              },
              child: Text('RESOURCES'),
            ),
            RaisedButton(
              child: Text(User.status != 2
                  ? 'I HAVE SYMPTOMS'
                  : 'SUBMIT SYMPTOM REPORT'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => print('button pr'),
            ),
          ],
        ),
      ),
    );
  }
}
