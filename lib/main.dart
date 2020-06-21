import 'package:flutter/material.dart';
import 'package:preven_tech/location/libLocation.dart';
import 'location/locationTracker.dart';
import 'package:geolocator/geolocator.dart';
import 'location/getInfected.dart';
import 'misc/nav.dart';
import 'misc/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Location History'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  LocationTracker locationTracker = LocationTracker.useMode(0);
  var locations = libLocation.locations;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await isInfected().then((value) {
            if (value) {
              User.status = 2;
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
            locations = LocationTracker.positions;
          });
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
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
                              'Long: ${locations[index].longitude}. Lat: ${locations[index].latitude}'),
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
