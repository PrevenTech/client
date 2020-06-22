import 'package:flutter/material.dart';
import 'misc/nav.dart';

class HotmapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hot Map'),),
      drawer: AppDrawer(),
      body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(image: AssetImage('assets/image.png'),),
    )
    );
  }
}