import 'package:flutter/material.dart';
import 'dart:async';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmrtSettingScreen extends StatefulWidget {
  @override
  _SmrtSettingScreenState createState() => _SmrtSettingScreenState();
}

class _SmrtSettingScreenState extends State<SmrtSettingScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _formKey = GlobalKey<FormState>();
  FocusNode focusNodeStaffId;
  FocusNode focusNodeMobileNo;

  String nric = '';
  String staffId = '';
  String mobileNo = '';
  int distance = 50;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    focusNodeStaffId = FocusNode();
    focusNodeMobileNo = FocusNode();

    _initPackageInfo();
    _initLocalStorage();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Future<void> _initLocalStorage() async {
    final SharedPreferences prefs = await _prefs;

    String nricSaved = prefs.getString('nric') ?? '';
    String staffIdSaved = prefs.getString('staffId') ?? '';
    String mobileNoSaved = prefs.getString('mobileNo') ?? '';
    int distanceSaved = prefs.getInt('distance') ?? 50;

    print(
        'nricSaved: $nricSaved, staffIdSaved: $staffIdSaved, mobileNoSaved: $mobileNoSaved, distanceSaved: $distanceSaved');

    setState(() {
      nric = nricSaved;
      staffId = staffIdSaved;
      mobileNo = mobileNoSaved;
      distance = distanceSaved;
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNodeStaffId.dispose();
    focusNodeMobileNo.dispose();
    super.dispose();
  }

  void save() async {
    print(
      'nric: $nric, staffId: $staffId, mobileNo: $mobileNo, distance: $distance',
    );
    var valid = _formKey.currentState.validate();
    if (!valid) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Your Info'),
        content: Text(
            'nric: $nric, staffId: $staffId, mobileNo: $mobileNo, distance: $distance'),
        actions: [
          FlatButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('nric', nric);
    await prefs.setString('staffId', staffId);
    await prefs.setString('mobileNo', mobileNo);
    await prefs.setInt('distance', distance);
  }

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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          // autofocus: true,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context)
                                .requestFocus(focusNodeStaffId);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a nric...',
                            labelText: 'NRIC',
                          ),
                          controller: TextEditingController(text: nric),
                          onChanged: (value) {
                            setState(() {
                              nric = value;
                            });
                          },
                        ),
                        TextFormField(
                          focusNode: focusNodeStaffId,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context)
                                .requestFocus(focusNodeMobileNo);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a staff ID...',
                            labelText: 'Staff ID',
                          ),
                          controller: TextEditingController(text: staffId),
                          onChanged: (value) {
                            setState(() {
                              staffId = value;
                            });
                          },
                        ),
                        TextFormField(
                          focusNode: focusNodeMobileNo,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter a mobile number...',
                            labelText: 'Mobile Number',
                          ),
                          controller: TextEditingController(text: mobileNo),
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
                        ListTile(
                          leading: Icon(Icons.filter_vintage),
                          title: Text(
                              'version: ${_packageInfo.version}+${_packageInfo.buildNumber}'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              save();
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
