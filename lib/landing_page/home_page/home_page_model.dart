import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isAdmin] action in HomePage widget.
  bool? rsIsAdmin;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  CompanyListRecord? rsCompanyData;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  EmployeeListRecord? rsCompany;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  TimeCheckListRecord? rs;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? rsDialog2;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? rsDialog;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? rsUser;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? rsDialog3;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? rsDialog4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
