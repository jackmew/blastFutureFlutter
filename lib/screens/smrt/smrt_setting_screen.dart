import 'package:flutter/material.dart';

class SmrtSettingScreen extends StatefulWidget {
  @override
  _SmrtSettingScreenState createState() => _SmrtSettingScreenState();
}

class _SmrtSettingScreenState extends State<SmrtSettingScreen> {
  final _formKey = GlobalKey<FormState>();
  String nric = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
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
                            hintText: 'Enter a title...',
                            labelText: 'Title',
                            // labelStyle: TextStyle(
                            //   color: Colors.deepOrange,
                            // ),
                            // focusedBorder: UnderlineInputBorder(
                            //   // borderRadius: BorderRadius.circular(25.0),
                            //   borderSide: BorderSide(
                            //     color: Colors.deepOrange,
                            //   ),
                            // ),
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
                            hintText: 'Enter a title...',
                            labelText: 'Title',
                          ),
                          onChanged: (value) {
                            setState(() {
                              nric = value;
                            });
                          },
                        ),
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
