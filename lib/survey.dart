import 'package:flutter/material.dart';
import 'misc/nav.dart';

class SurveyScreen extends StatefulWidget {
  @override
  createState() => SurveyScreenState();
}

enum YesOrNo {yes, no}

class SurveyScreenState extends State<SurveyScreen> {
  YesOrNo question1 = YesOrNo.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syptoms Survey'),
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('1. Have you ever come in contact with somebody who has been confirmed to have COVID-19?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: question1,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          question1 = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: question1,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          question1 = value;
                        });
                      },
                    ),
                    title: Text('No'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}