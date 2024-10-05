import '/backend/backend.dart';
import '/customer_view/customer_q_r_code_view/customer_q_r_code_view_widget.dart';
import '/customer_view/member_detail_view/member_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'member_list_view_widget.dart' show MemberListViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberListViewModel extends FlutterFlowModel<MemberListViewWidget> {
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

  // Stores action output result for [Bottom Sheet - MemberDetailView] action in Container widget.
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
