import 'package:flutter/material.dart';
import 'package:preven_tech/main.dart';
import 'package:preven_tech/status.dart';
import 'package:preven_tech/survey.dart';

class AppDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StatusScreen())),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location History'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage())),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Report Symptoms'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SurveyScreen())),
          ),
        ],
      ),
    );
  }
}