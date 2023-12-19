// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/flutter_flow/random_data_util.dart' as random_data;
import '/custom_code/actions/index.dart' as actions;

Future<String> generateCompanyCode() async {
  // Add your function code here!
  var tmpCode = random_data.randomInteger(000000, 999999).toString();
  var rs = await FirebaseFirestore.instance
      .collection('company_list')
      .where('company_code', isEqualTo: tmpCode)
      .get();
  if (rs.size != 0) {
    tmpCode = await actions.generateCompanyCode();
  }
  return tmpCode;
}
