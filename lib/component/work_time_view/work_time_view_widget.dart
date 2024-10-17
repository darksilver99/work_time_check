import '/backend/backend.dart';
import '/component/timer_view/timer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'work_time_view_model.dart';
export 'work_time_view_model.dart';

class WorkTimeViewWidget extends StatefulWidget {
  const WorkTimeViewWidget({super.key});

  @override
  State<WorkTimeViewWidget> createState() => _WorkTimeViewWidgetState();
}

class _WorkTimeViewWidgetState extends State<WorkTimeViewWidget> with WidgetsBindingObserver {
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
      await _model.initData(context);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _model.maybeDispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (state == AppLifecycleState.resumed) {
        await _model.initData(context);
        safeSetState(() {});
      }
    });


  }

  @override
  Widget build(BuildContext context) {
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
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  Padding(
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
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        if (_model.transactionDoc != null)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.timerViewModel,
                                  updateCallback: () => safeSetState(() {}),
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
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.isLoading = true;
                          safeSetState(() {});
                          await _model.initData(context);
                          safeSetState(() {});
                        },
                        child: FaIcon(
                          FontAwesomeIcons.redo,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
