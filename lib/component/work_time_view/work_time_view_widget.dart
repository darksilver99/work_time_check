import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/timer_view/timer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'work_time_view_model.dart';
export 'work_time_view_model.dart';

class WorkTimeViewWidget extends StatefulWidget {
  const WorkTimeViewWidget({super.key});

  @override
  State<WorkTimeViewWidget> createState() => _WorkTimeViewWidgetState();
}

class _WorkTimeViewWidgetState extends State<WorkTimeViewWidget> {
  late WorkTimeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkTimeViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().customerData.subject != null &&
          FFAppState().customerData.subject != '') {
        _model.transactionDoc = await queryTransacationListRecordOnce(
          parent: currentUserDocument?.currentCustomerRef,
          queryBuilder: (transacationListRecord) => transacationListRecord
              .where(
                'status',
                isEqualTo: 1,
              )
              .orderBy('date_in', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.transactionDoc != null) {
          _model.isLoading = false;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: !_model.isLoading,
      child: Align(
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'กำลังทำงาน',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Kanit',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    if (_model.transactionDoc?.dateIn != null)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.timerViewModel,
                              updateCallback: () => setState(() {}),
                              child: TimerViewWidget(
                                milliseconds: functions.millisecondsBetween(
                                    _model.transactionDoc!.dateIn!,
                                    getCurrentTimestamp),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
