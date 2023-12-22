import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_time_check_dialog_view_widget.dart';
import '/components/loading_view_widget.dart';
import '/components/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'time_check_history_page_widget.dart' show TimeCheckHistoryPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  void initState(BuildContext context) {
    noDataViewModel = createModel(context, () => NoDataViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    noDataViewModel.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
