import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_check_employee_list_page_widget.dart'
    show TimeCheckEmployeeListPageWidget;
import 'package:flutter/material.dart';

class TimeCheckEmployeeListPageModel
    extends FlutterFlowModel<TimeCheckEmployeeListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoDataView component.
  late NoDataViewModel noDataViewModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noDataViewModel = createModel(context, () => NoDataViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    noDataViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
