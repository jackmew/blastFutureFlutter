import 'package:flutter/material.dart';
import 'package:blastFutureFlutter/utils/notify.dart';

class TestAlertDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert & Dialog'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('ok'),
        onPressed: () {
          alert(context, 'title', 'content', 'ok');
        },
      )),
    );
  }
}
