import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GeolocatorScreen extends StatelessWidget {
  void getLocation(BuildContext context) async {
    // LocationPermission permission = await requestPermission();
    print('getLocation');
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print(position);
    print('getLocation end');
    Alert(context: context, title: "location", desc: position.toString())
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocator'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('Get Location'),
        onPressed: () {
          getLocation(context);
        },
      )),
    );
  }
}
