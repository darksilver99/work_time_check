import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'join_company_page_widget.dart' show JoinCompanyPageWidget;
import 'package:flutter/material.dart';

class JoinCompanyPageModel extends FlutterFlowModel<JoinCompanyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyListRecord? rs;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  EmployeeListRecord? rsEmployee;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
