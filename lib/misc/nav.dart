import 'package:flutter/material.dart';
import 'package:preven_tech/locationHistory.dart';
import 'package:preven_tech/status.dart';
import 'package:preven_tech/survey.dart';
import 'package:preven_tech/hotmap.dart';

class AppDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/drawerBackground.jpeg')
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('PrevenTech', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22.0, letterSpacing: 1.0),),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => StatusScreen())),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location History'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LocationHistoryScreen())),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Report Symptoms'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SurveyScreen())),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Hot Map'),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HotmapScreen())),
          ),
        ],
      ),
    );
  }
}