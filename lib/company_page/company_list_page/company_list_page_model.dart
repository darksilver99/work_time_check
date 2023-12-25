import '/flutter_flow/flutter_flow_util.dart';
import 'company_list_page_widget.dart' show CompanyListPageWidget;
import 'package:flutter/material.dart';

class CompanyListPageModel extends FlutterFlowModel<CompanyListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isAdmin] action in Container widget.
  bool? rsIsAdmin;

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
