
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static FToast? _fToast;

  static void initFToast(BuildContext context) {
    _fToast = FToast().init(context);
  }

  static void showSuccessToast(BuildContext context, String message) {
    _showToast(context, message, Colors.green, Icons.check, 2);
  }

  static void showErrorToast(BuildContext context, String message) {
    _showToast(context, message, Colors.red, Icons.error, 3);
  }

  static void showWarningToast(BuildContext context, String message) {
    _showToast(context, message, Colors.orange, Icons.warning, 3);
  }

  static void _showToast(BuildContext context, String message, Color backgroundColor, IconData icon, int seconds) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    _fToast?.showToast(
      child: toast,
      gravity: ToastGravity.TOP_RIGHT,
      toastDuration: Duration(seconds: seconds),
    );
  }
}
