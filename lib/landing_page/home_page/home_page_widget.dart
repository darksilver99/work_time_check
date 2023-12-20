import 'package:work_time_check/solo/CustomCameraPage.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/information_dialog_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(-60.0, -60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(60.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-60.0, -60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(60.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      FFAppState().currentLocation = currentUserLocationValue;
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (FFAppState().currentCompany != null)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<CompanyListRecord>(
                        stream: CompanyListRecord.getDocument(
                            FFAppState().currentCompany!),
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
                          final textCompanyListRecord = snapshot.data!;
                          return Text(
                            '${textCompanyListRecord.companyName} : ${textCompanyListRecord.companyCode}',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          );
                        },
                      ),
                    ],
                  ),
                Expanded(
                  child: MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return [
                        () => Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsets.all(6.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().currentCompany != null) {
                                      _model.rsCompany =
                                          await queryEmployeeListRecordOnce(
                                        queryBuilder: (employeeListRecord) =>
                                            employeeListRecord
                                                .where(
                                                  'create_by',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'company_ref',
                                                  isEqualTo: FFAppState()
                                                      .currentCompany,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.rsCompany?.reference != null) {
                                        _model.rs =
                                            await queryTimeCheckListRecordOnce(
                                          queryBuilder: (timeCheckListRecord) =>
                                              timeCheckListRecord
                                                  .where(
                                                    'create_by',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'status',
                                                    isEqualTo: 1,
                                                  )
                                                  .where(
                                                    'photo_out',
                                                    isEqualTo: ' ',
                                                  )
                                                  .where(
                                                    'company_ref',
                                                    isEqualTo: FFAppState()
                                                        .currentCompany,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        setState(() {
                                          _model.isDataUploading = false;
                                          _model.uploadedLocalFile =
                                              FFUploadedFile(
                                                  bytes:
                                                      Uint8List.fromList([]));
                                          _model.uploadedFileUrl = '';
                                        });

                                      /*final selectedMedia = await selectMedia(
                                        maxWidth: 600.00,
                                        imageQuality: 80,
                                        multiImage: false,
                                      );*/

                                      List<SelectedFile>? selectedMedia = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const CustomCameraPage()),
                                      );

                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl != null &&
                                            _model.uploadedFileUrl != '') {
                                          if (_model.rs?.reference != null) {
                                            context.pushNamed(
                                              'TimeCheckOutPage',
                                              queryParameters: {
                                                'photoPath': serializeParam(
                                                  _model.uploadedFileUrl,
                                                  ParamType.String,
                                                ),
                                                'currentTime': serializeParam(
                                                  getCurrentTimestamp,
                                                  ParamType.DateTime,
                                                ),
                                                'timeCheckParameter':
                                                    serializeParam(
                                                  _model.rs,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'timeCheckParameter': _model.rs,
                                              },
                                            );
                                          } else {
                                            context.pushNamed(
                                              'TimeCheckTodayPage',
                                              queryParameters: {
                                                'photoPath': serializeParam(
                                                  _model.uploadedFileUrl,
                                                  ParamType.String,
                                                ),
                                                'currentTime': serializeParam(
                                                  getCurrentTimestamp,
                                                  ParamType.DateTime,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }
                                      } else {
                                        setState(() {
                                          FFAppState().currentCompany = null;
                                        });

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'currentCompany':
                                                  FieldValue.delete(),
                                            },
                                          ),
                                        });
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: true,
                                          avoidOverflow: false,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child:
                                                    InformationDialogViewWidget(
                                                  msg:
                                                      'กรุณาเข้าร่วมองค์กรก่อน',
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.rsDialog2 = value));

                                        if ((_model.rsDialog2 != null) &&
                                            _model.rsDialog2!) {
                                          context.pushNamed('CompanyListPage');
                                        }
                                      }
                                    } else {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: true,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child:
                                                  InformationDialogViewWidget(
                                                msg: 'กรุณาเข้าร่วมองค์กรก่อน',
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.rsDialog = value));

                                      if ((_model.rsDialog != null) &&
                                          _model.rsDialog!) {
                                        context.pushNamed('CompanyListPage');
                                      }
                                    }

                                    setState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'ลง',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              ),
                            ),
                        () => Padding(
                              padding: EdgeInsets.all(6.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('TimeCheckHistoryPage');
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'ประ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            ),
                        () => Padding(
                              padding: EdgeInsets.all(6.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('CompanyManageListPage');
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'จัด',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                            ),
                        () => Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        '${currentUserDisplayName} ${currentUserEmail}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation4']!),
                            ),
                      ][index]();
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
