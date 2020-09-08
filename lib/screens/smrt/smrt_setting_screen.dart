import 'package:flutter/material.dart';

class SmrtSettingScreen extends StatefulWidget {
  @override
  _SmrtSettingScreenState createState() => _SmrtSettingScreenState();
}

class _SmrtSettingScreenState extends State<SmrtSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  String nric = '';
  String staffId = '';
  String mobileNo = '';
  int distance = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          // text content color
                          // style: TextStyle(
                          //   color: Colors.red,
                          // ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a nric...',
                            labelText: 'NRIC',
                          ),
                          onChanged: (value) {
                            setState(() {
                              nric = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a staff ID...',
                            labelText: 'Staff ID',
                          ),
                          onChanged: (value) {
                            setState(() {
                              staffId = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a mobile number...',
                            labelText: 'Mobile Number',
                          ),
                          onChanged: (value) {
                            setState(() {
                              mobileNo = value;
                            });
                          },
                        ),
                        RadioDistance(
                          distance: distance,
                          onChanged: (value) {
                            setState(() {
                              distance = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              print(
                                'nric: $nric, staffId: $staffId, mobileNo: $mobileNo, distance: $distance',
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            textColor: Colors.white,
                            child: const Text('Save',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          ),
                        )
                      ].expand(
                        (widget) => [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioDistance extends StatefulWidget {
  final int distance;
  final ValueChanged onChanged;

  RadioDistance({
    this.distance,
    this.onChanged,
  });

  @override
  _RadioDistanceState createState() => _RadioDistanceState();
}

class _RadioDistanceState extends State<RadioDistance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text('Select Distance in Meters:'),
          ),
        ),
        ListTile(
          title: const Text('50'),
          leading: Radio(
            value: 50,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
        ListTile(
          title: const Text('100'),
          leading: Radio(
            value: 100,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
        ListTile(
          title: const Text('150'),
          leading: Radio(
            value: 150,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
        ListTile(
          title: const Text('200'),
          leading: Radio(
            value: 200,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
        ListTile(
          title: const Text('250'),
          leading: Radio(
            value: 250,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
        ListTile(
          title: const Text('300'),
          leading: Radio(
            value: 300,
            groupValue: widget.distance,
            onChanged: (int value) {
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
