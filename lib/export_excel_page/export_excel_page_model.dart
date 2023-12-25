import '/flutter_flow/flutter_flow_util.dart';
import 'export_excel_page_widget.dart' show ExportExcelPageWidget;
import 'package:flutter/material.dart';

class ExportExcelPageModel extends FlutterFlowModel<ExportExcelPageWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  DateTime? endDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Custom Action - exportExcel] action in Button widget.
  String? path;

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
