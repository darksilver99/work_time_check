import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_in_view_widget.dart' show CheckInViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckInViewModel extends FlutterFlowModel<CheckInViewWidget> {
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

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
