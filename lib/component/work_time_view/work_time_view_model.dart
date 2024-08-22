import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/timer_view/timer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'work_time_view_widget.dart' show WorkTimeViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkTimeViewModel extends FlutterFlowModel<WorkTimeViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  TransacationListRecord? transactionDoc;

  ///  State fields for stateful widgets in this component.

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

  /// Action blocks.
  Future initData(BuildContext context) async {
    TransacationListRecord? transactionDoc;

    if (FFAppState().customerData.subject != null &&
        FFAppState().customerData.subject != '') {
      transactionDoc = await queryTransacationListRecordOnce(
        parent: currentUserDocument?.currentCustomerRef,
        queryBuilder: (transacationListRecord) => transacationListRecord
            .where(
              'status',
              isEqualTo: 1,
            )
            .where(
              'member_ref',
              isEqualTo: FFAppState().memberData.memberRef,
            )
            .orderBy('date_in', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (transactionDoc != null) {
        isLoading = false;
        transactionDoc = transactionDoc;
      }
    }
  }
}
