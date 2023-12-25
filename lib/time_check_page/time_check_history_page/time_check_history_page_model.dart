import '/components/loading_view_widget.dart';
import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_check_history_page_widget.dart' show TimeCheckHistoryPageWidget;
import 'package:flutter/material.dart';

class TimeCheckHistoryPageModel
    extends FlutterFlowModel<TimeCheckHistoryPageWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFirstDayOfMonth] action in TimeCheckHistoryPage widget.
  DateTime? firstDate;
  // Model for NoDataView component.
  late NoDataViewModel noDataViewModel;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noDataViewModel = createModel(context, () => NoDataViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    noDataViewModel.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
