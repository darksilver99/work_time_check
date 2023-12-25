import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'employee_setting_view_widget.dart' show EmployeeSettingViewWidget;
import 'package:flutter/material.dart';

class EmployeeSettingViewModel
    extends FlutterFlowModel<EmployeeSettingViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  AdminListRecord? rsAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  int? totalAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AdminListRecord? rsAdmin1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalAdmin2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalAdmin3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
