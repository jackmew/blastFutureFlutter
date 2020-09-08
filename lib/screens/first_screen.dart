import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

FlatButton buildButton({BuildContext context, String screenName}) {
  return FlatButton.icon(
    label: Text(screenName),
    icon: Icon(Icons.done),
    onPressed: () {
      print('button: $screenName');
      Navigator.pushNamed(context, '/$screenName');
    },
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('First Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              buildButton(context: context, screenName: 'layout'),
              buildButton(context: context, screenName: 'geolocator'),
              buildButton(context: context, screenName: 'map'),
              buildButton(context: context, screenName: 'deviceInfo'),
              buildButton(context: context, screenName: 'packageInfo'),
              buildButton(context: context, screenName: 'bottomSheet'),
              buildButton(context: context, screenName: 'testAlertDialog'),
              buildButton(context: context, screenName: 'smrtStartScreen'),
              buildButton(context: context, screenName: 'smrtSettingScreen'),
            ],
          ),
        ),
      ),
    );
  }
}
