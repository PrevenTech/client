import 'package:flutter/material.dart';
import 'misc/nav.dart';

class SurveyScreen extends StatefulWidget {
  @override
  createState() => SurveyScreenState();
}

enum YesOrNo {yes, no}

class SurveyScreenState extends State<SurveyScreen> {
  var radioItem = YesOrNo.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms Survey'),
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
                  Text('1. Have you come into close contact (within 6 feet) with someone who has a laboratory confirmed COVID – 19 diagnosis in the past 14 days?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('No'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('2. Do you have fever or chills?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('No'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('3. Do you have shortness of breath or difficulty breathing?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('No'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('4. Do you have headache?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('No'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('5. Do you have sore throat?', style: TextStyle(fontWeight: FontWeight.w400),),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.yes,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                    title: Text('Yes'),
                  ),
                  ListTile(
                    leading: Radio(
                      groupValue: radioItem,
                      value: YesOrNo.no,
                      onChanged: (YesOrNo value) {
                        this.setState(() {
                          radioItem = value;
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