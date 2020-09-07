import 'package:flutter/material.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SmrtStartScreen extends StatefulWidget {
  @override
  _SmrtStartScreenState createState() => _SmrtStartScreenState();
}

class _SmrtStartScreenState extends State<SmrtStartScreen> {
  GlobalKey<ExpandableBottomSheetState> key = new GlobalKey();
  ExpansionStatus _expansionStatus = ExpansionStatus.contracted;
  @override
  void initState() {
    super.initState();
    // _initBottomSheet();
  }

  // void _initBottomSheet() {
  //   // expand();
  //   // setState(() {
  //   key.currentState.expand();
  //   // });
  // }
  void expand() => key.currentState.expand();
  void contract() => key.currentState.contract();
  ExpansionStatus status() => key.currentState.expansionStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('SMRT'),
      ),
      body: ExpandableBottomSheet(
        key: key,
        background: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                // "SMRT Corporation Ltd", new LatLng(1.3942531, 103.9129330)
                target: LatLng(1.3942531, 103.9129330),
                zoom: 12,
              ),
            ),
            new Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(
                icon: Icon(Icons.settings),
                color: Colors.deepOrange,
                iconSize: 28,
                // tooltip: 'Increase volume by 10',
                onPressed: () {
                  // setState(() {
                  //   _volume += 10;
                  // });
                },
              ),
            ),
          ],
        ),
        persistentHeader: Container(
          // constraints: BoxConstraints.expand(height: 40),
          height: 60,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                height: 8.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB((0.25 * 255).round(), 0, 0, 0),
                ),
              ),
            ),
          ),
        ),
        expandableContent: Container(
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage('images/smrt_logo.png'),
                    width: 150,
                    height: 80,
                  ),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.access_time,
                        size: 35.0,
                        color: Colors.deepOrange,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.exit_to_app,
                        size: 35.0,
                        color: Colors.deepOrange,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
