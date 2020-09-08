import 'package:flutter/material.dart';

void alert(
    BuildContext context, String title, String content, String buttonText) {
  showDialog(
    context: context,
    child: AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          child: Text(buttonText),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
