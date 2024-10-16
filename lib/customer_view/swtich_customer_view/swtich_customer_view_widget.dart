import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/customer_view/customer_member_view/customer_member_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swtich_customer_view_model.dart';
export 'swtich_customer_view_model.dart';

class SwtichCustomerViewWidget extends StatefulWidget {
  const SwtichCustomerViewWidget({super.key});

  @override
  State<SwtichCustomerViewWidget> createState() =>
      _SwtichCustomerViewWidgetState();
}

class _SwtichCustomerViewWidgetState extends State<SwtichCustomerViewWidget> {
  late SwtichCustomerViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwtichCustomerViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startDate = functions.getFirstDayOfMonth(getCurrentTimestamp);
      _model.endDate = functions.getLastDayOfMonth(getCurrentTimestamp);
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'สลับองค์กร',
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
            child: FutureBuilder<List<MemberListRecord>>(
              future: queryMemberListRecordOnce(
                queryBuilder: (memberListRecord) => memberListRecord.where(
                  'create_by',
                  isEqualTo: currentUserReference,
                ),
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
                List<MemberListRecord> listViewMemberListRecordList =
                    snapshot.data!;
                if (listViewMemberListRecordList.isEmpty) {
                  return NoDataViewWidget();
                }

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    180.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewMemberListRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewMemberListRecord =
                        listViewMemberListRecordList[listViewIndex];
                    return CustomerMemberViewWidget(
                      key: Key(
                          'Keyqhu_${listViewIndex}_of_${listViewMemberListRecordList.length}'),
                      customerRef: listViewMemberListRecord.parentReference,
                      memberDoc: listViewMemberListRecord,
                      showSetting: false,
                      showSwtich: true,
                      showBadge: false,
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
