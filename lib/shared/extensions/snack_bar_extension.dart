import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, Text, SnackBar, Colors;

enum SnackBarType { sucess, error }

extension SnackBarExtension on BuildContext {
  void showSnackBar(SnackBarType snackBarType, String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: switch (snackBarType) {
            SnackBarType.sucess => Colors.green,
            SnackBarType.error => Colors.redAccent,
          },
        ),
      );
  }
}
