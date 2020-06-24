import 'package:flutter/material.dart';
import 'misc/nav.dart';
import 'location/libLocation.dart';
import 'location/getInfected.dart';
import 'misc/user.dart';

class LocationHistoryScreen extends StatefulWidget {
  LocationHistoryScreen({Key key}) : super(key: key);

  @override
  _LocationHistoryScreenState createState() => _LocationHistoryScreenState();
}

class _LocationHistoryScreenState extends State<LocationHistoryScreen> {
  // LocationTracker locationTracker = LocationTracker.useMode(0);
  List<dynamic> locations = LocationRegistry.locations;

  @override
  void initState() {
    print('Registred locations: ${locations.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await isInfected().then((value) {
            if (value) {
              User.status.value = 2;
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('You have been exposed to COVID-19'),
                    content: Text('We have detected you were in contact with a person infected with COVID-19. Please self isolate and take the necessary precautions. Contact your health care provider if you present any symptoms. You can find more information on the app\'s status screen.'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('I UNDERSTAND'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  );
                }
              );
            }
          });
          this.setState(() {
            locations = LocationRegistry.locations;
          });
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text('Location History'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.location_city),
                          title: Text('Location'),
                          subtitle: Text(
                              'Lat: ${locations[index]["latitude"]}, Long: ${locations[index]["longitude"]}'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
