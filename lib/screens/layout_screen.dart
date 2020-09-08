import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout'),
        ),
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black12,
                width: 100,
                // height: 100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Zaira'),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black26,
                width: 100,
                // height: 100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Zest'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.black38,
                width: 100,
                // height: 100,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Mew'),
                ),
              ),
            ),
          ],
        ));
  }
}
