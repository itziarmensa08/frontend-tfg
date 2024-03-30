import 'package:flutter/material.dart';

Future<void> showAlert(
  BuildContext context,
  String title,
  String message,
  String button1,
  String? button2,
  Color color,
  Color colorText,
  VoidCallback onPressedButton1,
  VoidCallback? onPressedButton2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: color,
        title: Text(title, style: TextStyle(color: colorText)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message, style: TextStyle(color: colorText),),
            ],
          ),
        ),
        actions: <Widget>[
          if (button2 != null)
          TextButton(
            onPressed: onPressedButton2,
            child: Text(button2, style: TextStyle(color: colorText)),
          ),
          TextButton(
            onPressed: onPressedButton1,
            child: Text(button1, style: TextStyle(color: colorText))
          ),
        ],
      );
    },
  );
}