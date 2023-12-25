import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'employee_setting_view_model.dart';
export 'employee_setting_view_model.dart';

class EmployeeSettingViewWidget extends StatefulWidget {
  const EmployeeSettingViewWidget({
    Key? key,
    required this.employeeParameter,
    required this.userParameter,
  }) : super(key: key);

  final EmployeeListRecord? employeeParameter;
  final UsersRecord? userParameter;

  @override
  _EmployeeSettingViewWidgetState createState() =>
      _EmployeeSettingViewWidgetState();
}

class _EmployeeSettingViewWidgetState extends State<EmployeeSettingViewWidget> {
  late EmployeeSettingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeSettingViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FlutterFlowDropDown<int>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<int>(
                            _model.dropDownValue ??=
                                widget.employeeParameter?.status,
                          ),
                          options: List<int>.from([0, 1]),
                          optionLabels: ['รออนุมัติ', 'อนุมัติ'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Please select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: StreamBuilder<List<AdminListRecord>>(
                      stream: queryAdminListRecord(
                        queryBuilder: (adminListRecord) => adminListRecord
                            .where(
                              'user_ref',
                              isEqualTo: widget.userParameter?.reference,
                            )
                            .where(
                              'status',
                              isEqualTo: 1,
                            ),
                        singleRecord: true,
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
                        List<AdminListRecord> rowAdminListRecordList =
                            snapshot.data!;
                        final rowAdminListRecord =
                            rowAdminListRecordList.isNotEmpty
                                ? rowAdminListRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  unselectedWidgetColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                                child: CheckboxListTile(
                                  value: _model.checkboxListTileValue ??=
                                      rowAdminListRecord?.reference != null,
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                        .checkboxListTileValue = newValue!);
                                  },
                                  title: Text(
                                    'แอดมิน',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Kanit',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: FlutterFlowTheme.of(context).info,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'ต้องการลบ ${widget.userParameter?.displayName} ออกจากองค์กร?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('ยกเลิก'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('ตกลง'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                _model.rsAdmin = await queryAdminListRecordOnce(
                                  queryBuilder: (adminListRecord) =>
                                      adminListRecord
                                          .where(
                                            'status',
                                            isEqualTo: 1,
                                          )
                                          .where(
                                            'company_ref',
                                            isEqualTo: widget
                                                .employeeParameter?.companyRef,
                                          )
                                          .where(
                                            'user_ref',
                                            isEqualTo:
                                                widget.userParameter?.reference,
                                          ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.rsAdmin != null) {
                                  _model.totalAdmin =
                                      await queryAdminListRecordCount(
                                    queryBuilder: (adminListRecord) =>
                                        adminListRecord
                                            .where(
                                              'status',
                                              isEqualTo: 1,
                                            )
                                            .where(
                                              'company_ref',
                                              isEqualTo: widget
                                                  .employeeParameter
                                                  ?.companyRef,
                                            ),
                                  );
                                  if (_model.totalAdmin! <= 1) {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: InformationDialogViewWidget(
                                            msg:
                                                'ไม่สามารถบันทึกข้อมูลได้เนื่องจากจำเป็นต้องเหลือ แอดมิน อย่างน้อย 1 คน',
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  } else {
                                    await widget.employeeParameter!.reference
                                        .delete();
                                    await _model.rsAdmin!.reference.delete();
                                    _model.totalEmployee2 =
                                        await queryEmployeeListRecordCount(
                                      queryBuilder: (employeeListRecord) =>
                                          employeeListRecord.where(
                                        'company_ref',
                                        isEqualTo: FFAppState().currentCompany,
                                      ),
                                    );
                                    if (_model.totalEmployee2! > 8) {
                                      await FFAppState()
                                          .currentCompany!
                                          .update(createCompanyListRecordData(
                                            isFree: false,
                                          ));
                                    } else {
                                      await FFAppState()
                                          .currentCompany!
                                          .update(createCompanyListRecordData(
                                            isFree: true,
                                          ));
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ลบข้อมูลเรียบร้อยแล้ว',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 2000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  await widget.employeeParameter!.reference
                                      .delete();
                                  _model.totalEmployee =
                                      await queryEmployeeListRecordCount(
                                    queryBuilder: (employeeListRecord) =>
                                        employeeListRecord.where(
                                      'company_ref',
                                      isEqualTo: FFAppState().currentCompany,
                                    ),
                                  );
                                  if (_model.totalEmployee! > 8) {
                                    await FFAppState()
                                        .currentCompany!
                                        .update(createCompanyListRecordData(
                                          isFree: false,
                                        ));
                                  } else {
                                    await FFAppState()
                                        .currentCompany!
                                        .update(createCompanyListRecordData(
                                          isFree: true,
                                        ));
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'ลบข้อมูลเรียบร้อยแล้ว',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }

                                Navigator.pop(context);
                              }

                              setState(() {});
                            },
                            child: Text(
                              'ลบพนักงาน',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context).error,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.rsAdmin1 = await queryAdminListRecordOnce(
                            queryBuilder: (adminListRecord) => adminListRecord
                                .where(
                                  'status',
                                  isEqualTo: 1,
                                )
                                .where(
                                  'company_ref',
                                  isEqualTo:
                                      widget.employeeParameter?.companyRef,
                                )
                                .where(
                                  'user_ref',
                                  isEqualTo: widget.userParameter?.reference,
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;
                          if (_model.dropDownValue == 0) {
                            if (_model.checkboxListTileValue!) {
                              await showAlignedDialog(
                                context: context,
                                isGlobal: true,
                                avoidOverflow: false,
                                targetAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                followerAnchor: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                builder: (dialogContext) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: InformationDialogViewWidget(
                                      msg: 'กรุณาอนุมัติพนักงาน',
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              if (_model.rsAdmin1 != null) {
                                _model.totalAdmin2 =
                                    await queryAdminListRecordCount(
                                  queryBuilder: (adminListRecord) =>
                                      adminListRecord
                                          .where(
                                            'status',
                                            isEqualTo: 1,
                                          )
                                          .where(
                                            'company_ref',
                                            isEqualTo: widget
                                                .employeeParameter?.companyRef,
                                          ),
                                );
                                _shouldSetState = true;
                                if (_model.totalAdmin2! <= 1) {
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: InformationDialogViewWidget(
                                          msg:
                                              'ไม่สามารถบันทึกข้อมูลได้เนื่องจากจำเป็นต้องเหลือ แอดมิน อย่างน้อย 1 คน',
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  await _model.rsAdmin1!.reference.delete();
                                }
                              }
                            }
                          } else {
                            if (_model.checkboxListTileValue!) {
                              if (!(_model.rsAdmin1 != null)) {
                                await AdminListRecord.collection
                                    .doc()
                                    .set(createAdminListRecordData(
                                      createDate: getCurrentTimestamp,
                                      createBy: currentUserReference,
                                      userRef: widget.userParameter?.reference,
                                      companyRef:
                                          widget.employeeParameter?.companyRef,
                                      status: 1,
                                    ));
                              }
                            } else {
                              if (_model.rsAdmin1 != null) {
                                _model.totalAdmin3 =
                                    await queryAdminListRecordCount(
                                  queryBuilder: (adminListRecord) =>
                                      adminListRecord
                                          .where(
                                            'status',
                                            isEqualTo: 1,
                                          )
                                          .where(
                                            'company_ref',
                                            isEqualTo: widget
                                                .employeeParameter?.companyRef,
                                          ),
                                );
                                _shouldSetState = true;
                                if (_model.totalAdmin3! <= 1) {
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: InformationDialogViewWidget(
                                          msg:
                                              'ไม่สามารถบันทึกข้อมูลได้เนื่องจากจำเป็นต้องเหลือ แอดมิน อย่างน้อย 1 คน',
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  await _model.rsAdmin1!.reference.delete();
                                }
                              }
                            }
                          }

                          await widget.employeeParameter!.reference
                              .update(createEmployeeListRecordData(
                            updateDate: getCurrentTimestamp,
                            updateBy: currentUserReference,
                            status: _model.dropDownValue,
                          ));
                          Navigator.pop(context);
                          if (_shouldSetState) setState(() {});
                        },
                        text: 'ตกลง',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Kanit',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
