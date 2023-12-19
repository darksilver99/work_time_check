import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_view_widget.dart';
import '/components/still_no_company_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_check_history_page_model.dart';
export 'time_check_history_page_model.dart';

class TimeCheckHistoryPageWidget extends StatefulWidget {
  const TimeCheckHistoryPageWidget({Key? key}) : super(key: key);

  @override
  _TimeCheckHistoryPageWidgetState createState() =>
      _TimeCheckHistoryPageWidgetState();
}

class _TimeCheckHistoryPageWidgetState
    extends State<TimeCheckHistoryPageWidget> {
  late TimeCheckHistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeCheckHistoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.firstDate = await actions.getFirstDayOfMonth();
      setState(() {
        _model.startDate = _model.firstDate;
        _model.isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'ประวัติลงเวลา',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (FFAppState().currentCompany == null)
                  Expanded(
                    child: wrapWithModel(
                      model: _model.stillNoCompanyViewModel,
                      updateCallback: () => setState(() {}),
                      child: StillNoCompanyViewWidget(),
                    ),
                  ),
                if (_model.isLoading)
                  Expanded(
                    child: wrapWithModel(
                      model: _model.loadingViewModel,
                      updateCallback: () => setState(() {}),
                      child: LoadingViewWidget(),
                    ),
                  ),
                if (!_model.isLoading && (FFAppState().currentCompany != null))
                  Expanded(
                    child: StreamBuilder<List<TimeCheckListRecord>>(
                      stream: queryTimeCheckListRecord(
                        queryBuilder: (timeCheckListRecord) =>
                            timeCheckListRecord
                                .where(
                                  'company_ref',
                                  isEqualTo: FFAppState().currentCompany,
                                )
                                .where(
                                  'create_by',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'create_date',
                                  isGreaterThanOrEqualTo: _model.startDate,
                                )
                                .orderBy('create_date', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<TimeCheckListRecord>
                            listViewTimeCheckListRecordList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewTimeCheckListRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTimeCheckListRecord =
                                listViewTimeCheckListRecordList[listViewIndex];
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
