import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/timer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'work_time_view_widget.dart' show WorkTimeViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkTimeViewModel extends FlutterFlowModel<WorkTimeViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in WorkTimeView widget.
  TransacationListRecord? transactionDoc;
  // Model for TimerView component.
  late TimerViewModel timerViewModel;

  @override
  void initState(BuildContext context) {
    timerViewModel = createModel(context, () => TimerViewModel());
  }

  @override
  void dispose() {
    timerViewModel.dispose();
  }
}
