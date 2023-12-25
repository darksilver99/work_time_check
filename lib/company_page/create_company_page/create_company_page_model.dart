import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_company_page_widget.dart' show CreateCompanyPageWidget;
import 'package:flutter/material.dart';

class CreateCompanyPageModel extends FlutterFlowModel<CreateCompanyPageWidget> {
  ///  Local state fields for this page.

  String? startTime;

  String endTime = '';

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

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - generateCompanyCode] action in Button widget.
  String? companyCode;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyListRecord? rs;

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
