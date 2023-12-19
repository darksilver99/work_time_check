// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime> getFirstDayOfMonth() async {
  // Add your function code here!
  DateTime currentDate = DateTime.now();
  DateTime firstDayOfCurrentMonth =
      DateTime(currentDate.year, currentDate.month, 1);
  return firstDayOfCurrentMonth;
}
