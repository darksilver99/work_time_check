import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/letter_page/letter_detail_view/letter_detail_view_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'letter_history_view_model.dart';
export 'letter_history_view_model.dart';

class LetterHistoryViewWidget extends StatefulWidget {
  const LetterHistoryViewWidget({
    super.key,
    required this.customerRef,
    required this.memberRef,
  });

  final DocumentReference? customerRef;
  final DocumentReference? memberRef;

  @override
  State<LetterHistoryViewWidget> createState() =>
      _LetterHistoryViewWidgetState();
}

class _LetterHistoryViewWidgetState extends State<LetterHistoryViewWidget> {
  late LetterHistoryViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LetterHistoryViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'ประวัติลางาน',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kanit',
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<LetterListRecord>>(
              stream: queryLetterListRecord(
                parent: widget!.customerRef,
                queryBuilder: (letterListRecord) => letterListRecord
                    .where(
                      'member_ref',
                      isEqualTo: widget!.memberRef,
                    )
                    .orderBy('start_date', descending: true),
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
                List<LetterListRecord> listViewLetterListRecordList =
                    snapshot.data!;
                if (listViewLetterListRecordList.isEmpty) {
                  return NoDataViewWidget();
                }

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    180.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: listViewLetterListRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewLetterListRecord =
                        listViewLetterListRecordList[listViewIndex];
                    return Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: LetterDetailViewWidget(
                                    letterDocument: listViewLetterListRecord,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 8.0, 4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'วันที่ขอลา ${functions.dateTh(listViewLetterListRecord.startDate)} - ${functions.dateTh(listViewLetterListRecord.endDate)}',
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'สถานะ ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: functions.getStatusText(
                                                          listViewLetterListRecord
                                                              .status,
                                                          FFAppState()
                                                              .letterStatusList
                                                              .toList()),
                                                      style: TextStyle(
                                                        color: () {
                                                          if (listViewLetterListRecord
                                                                  .status ==
                                                              0) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary;
                                                          } else if (listViewLetterListRecord
                                                                  .status ==
                                                              1) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .success;
                                                          } else if (listViewLetterListRecord
                                                                  .status ==
                                                              2) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .error;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          }
                                                        }(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.navigate_next_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 32.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
