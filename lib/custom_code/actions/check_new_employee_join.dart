// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future checkNewEmployeeJoin() async {
  // Add your function code here!
  if (FFAppState().currentCompany == null) {
    return;
  }
  FirebaseFirestore.instance
      .doc(FFAppState().currentCompany!.path)
      .snapshots()
      .listen((event) {
    print("checkNewEmployeeJoin");
    print(event.data());
    if (event.data()!.containsKey("total_badge")) {
      if (event.data()!["total_badge"] > 0) {
        FFAppState().update(() {
          FFAppState().isHasUserJoin = true;
        });
      } else {
        FFAppState().update(() {
          FFAppState().isHasUserJoin = false;
        });
      }
    }
  });
}
