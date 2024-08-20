import '/backend/backend.dart';
import '/customer_view/member_setting_view/member_setting_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'member_view_widget.dart' show MemberViewWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberViewModel extends FlutterFlowModel<MemberViewWidget> {
  ///  Local state fields for this component.

  DateTime? currentDate;

  List<FFUploadedFile> tmpPhotoList = [];
  void addToTmpPhotoList(FFUploadedFile item) => tmpPhotoList.add(item);
  void removeFromTmpPhotoList(FFUploadedFile item) => tmpPhotoList.remove(item);
  void removeAtIndexFromTmpPhotoList(int index) => tmpPhotoList.removeAt(index);
  void insertAtIndexInTmpPhotoList(int index, FFUploadedFile item) =>
      tmpPhotoList.insert(index, item);
  void updateTmpPhotoListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpPhotoList[index] = updateFn(tmpPhotoList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? isUpdate;
  Completer<List<MemberListRecord>>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
