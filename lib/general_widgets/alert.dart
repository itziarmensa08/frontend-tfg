import 'package:flutter/material.dart';

Future<void> showAlert(
  BuildContext context,
  String title,
  String message,
  String button1,
  String? button2,
  Color color,
  VoidCallback onPressedButton1,
  VoidCallback? onPressedButton2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color,
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          if (button2 != null)
          TextButton(
            onPressed: onPressedButton2,
            child: Text(button2),
          ),
          TextButton(
            onPressed: onPressedButton1,
            child: Text(button1)
          ),
        ],
      );
    },
  );
}