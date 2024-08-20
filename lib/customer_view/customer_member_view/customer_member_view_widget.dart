import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'customer_member_view_model.dart';
export 'customer_member_view_model.dart';

class CustomerMemberViewWidget extends StatefulWidget {
  const CustomerMemberViewWidget({
    super.key,
    required this.customerRef,
    required this.memberDoc,
  });

  final DocumentReference? customerRef;
  final MemberListRecord? memberDoc;

  @override
  State<CustomerMemberViewWidget> createState() =>
      _CustomerMemberViewWidgetState();
}

class _CustomerMemberViewWidgetState extends State<CustomerMemberViewWidget> {
  late CustomerMemberViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerMemberViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: FutureBuilder<CustomerRecord>(
        future: CustomerRecord.getDocumentOnce(widget!.customerRef!),
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

          final containerCustomerRecord = snapshot.data!;

          return Material(
            color: Colors.transparent,
            elevation: 3.0,
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget!.customerRef !=
                          currentUserDocument?.currentCustomerRef) {
                        _model.isConfirm = await action_blocks.confirmBlock(
                          context,
                          title: 'ต้องการสลับองค์กร?',
                        );
                        if (_model.isConfirm!) {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            currentCustomerRef: widget!.customerRef,
                          ));
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
                                  child: InfoCustomViewWidget(
                                    title: 'สลับองค์กรเรียบร้อบแล้ว',
                                  ),
                                ),
                              );
                            },
                          );

                          await actions.pushReplacement(
                            context,
                            null,
                          );
                        }
                      }

                      setState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                containerCustomerRecord.subject,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Kanit',
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                '(${widget!.memberDoc?.permission == 'admin' ? 'เจ้าหน้าที่' : 'สมาชิกทั่วไป'})',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Kanit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (currentUserDocument?.currentCustomerRef ==
                                widget!.customerRef) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 32.0,
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 32.0,
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
