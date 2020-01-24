
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/services/data_manager.dart';
import 'package:flutter_demo_app/services/models/error_response/error_response.dart';

class ErrorHandler {
  BuildContext context;

  ErrorHandler(this.context);

  void showError(ErrorResponse errorResponse) {
    if (errorResponse.field == "Authorization") {
      new DataManager().clearAllPreference();

      Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

      //Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}
