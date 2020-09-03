import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

FlatButton buildButton({BuildContext context, Color color, String screenName}) {
  return FlatButton.icon(
    label: Text(screenName),
    icon: Icon(Icons.done),
    color: color,
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
              buildButton(
                  context: context, color: Colors.purple, screenName: 'layout'),
              buildButton(
                  context: context,
                  color: Colors.red,
                  screenName: 'geolocator'),
            ],
          ),
        ),
      ),
    );
  }
}
