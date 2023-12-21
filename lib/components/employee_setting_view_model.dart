import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'employee_setting_view_widget.dart' show EmployeeSettingViewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  AdminListRecord? rsAdmin4;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AdminListRecord? rsAdmin2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalAdmin2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AdminListRecord? rsAdmin3;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalAdmin3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
