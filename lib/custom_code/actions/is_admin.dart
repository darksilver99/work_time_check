// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:work_time_check/auth/firebase_auth/auth_util.dart';

Future<bool> isAdmin() async {
  // Add your function code here!
  if (FFAppState().currentCompany == null) {
    return false;
  }
  var rs = await FirebaseFirestore.instance
      .collection("admin_list")
      .where("company_ref", isEqualTo: FFAppState().currentCompany)
      .where("user_ref", isEqualTo: currentUserReference)
      .get();
  if (rs.size == 0) {
    return false;
  }
  return true;
}
