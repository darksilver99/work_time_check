import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

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
