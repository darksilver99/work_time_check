import '/backend/backend.dart';
import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'time_check_employee_list_page_widget.dart'
    show TimeCheckEmployeeListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeCheckEmployeeListPageModel
    extends FlutterFlowModel<TimeCheckEmployeeListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoDataView component.
  late NoDataViewModel noDataViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    noDataViewModel = createModel(context, () => NoDataViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    noDataViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
