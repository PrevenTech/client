import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:preven_tech/misc/fileManager.dart';
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
    if (!User.ready) {
      User.init();
    }
    if (!LocationRegistry.ready) {
      LocationRegistry.init();

      const locationOptions =
          LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 10);
      final Stream<Position> positionStream =
          Geolocator().getPositionStream(locationOptions);
      StreamSubscription<Position> _positionStreamSubscription =
          positionStream.listen((Position position) {
        LocationRegistry.addLocation(position.toJson());
        //print(position);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Normal',
      'Possible exposure to COVID-19',
      'Exposure to COVID-19',
      'Possible Immunity'
    ];
    List<Color> colors = [
      Theme.of(context).primaryColor,
      Colors.yellow,
      Colors.red,
      Colors.green
    ];
    List<String> descs = [
      "You haven't been exposed to COVID-19",
      "You may have been exposed to COVID-19. Take the necessary precuations and only go out if necessary",
      "You have been exposed to COVID-19. Take the necessary precuations and self isolate",
      "You are probably immune to COVID-19"
    ];
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Status')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ValueListenableBuilder(
            valueListenable: User.status,
            builder: (BuildContext context, int value, Widget child) {
              print('Val: $value');
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colors[value],
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
                    labels[value],
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    descs[value],
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
                    child: Text(value != 2
                        ? 'I HAVE SYMPTOMS'
                        : 'SUBMIT SYMPTOM REPORT'),
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () => print('button pr'),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
