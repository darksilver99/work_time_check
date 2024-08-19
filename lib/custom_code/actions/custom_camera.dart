// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:work_time_check/solo/CustomCameraPage.dart';
import 'package:work_time_check/flutter_flow/upload_data.dart';

Future<List<FFUploadedFile>?> customCamera(BuildContext context) async {
  // Add your function code here!

  List<SelectedFile>? selectedMedia = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CustomCameraPage()),
  );

  if (selectedMedia != null &&
      selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
    var selectedUploadedFiles = <FFUploadedFile>[];
    try {
      selectedUploadedFiles = selectedMedia
          .map((m) => FFUploadedFile(
                name: m.storagePath.split('/').last,
                bytes: m.bytes,
                height: m.dimensions?.height,
                width: m.dimensions?.width,
                blurHash: m.blurHash,
              ))
          .toList();
    } finally {}
    if (selectedUploadedFiles.length == selectedMedia.length) {
      return [selectedUploadedFiles.first];
    } else {
      return null;
    }
  }
  return null;
}
