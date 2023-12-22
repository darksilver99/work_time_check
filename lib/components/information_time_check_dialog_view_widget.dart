import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'information_time_check_dialog_view_model.dart';
export 'information_time_check_dialog_view_model.dart';

class InformationTimeCheckDialogViewWidget extends StatefulWidget {
  const InformationTimeCheckDialogViewWidget({
    Key? key,
    required this.timeCheckParameter,
  }) : super(key: key);

  final TimeCheckListRecord? timeCheckParameter;

  @override
  _InformationTimeCheckDialogViewWidgetState createState() =>
      _InformationTimeCheckDialogViewWidgetState();
}

class _InformationTimeCheckDialogViewWidgetState
    extends State<InformationTimeCheckDialogViewWidget> {
  late InformationTimeCheckDialogViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformationTimeCheckDialogViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.65,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.timeCheckParameter!.photoIn,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'เวลาเข้า : ${dateTimeFormat('Hm', widget.timeCheckParameter?.createDate)}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Kanit',
                      fontSize: 22.0,
                    ),
              ),
              Text(
                'รายละเอียด(เข้า) : ${valueOrDefault<String>(
                  widget.timeCheckParameter?.detailIn,
                  '-',
                )}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Kanit',
                      fontSize: 22.0,
                    ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.timeCheckParameter!.photoOut,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'เวลาออก : ${valueOrDefault<String>(
                  dateTimeFormat('Hm', widget.timeCheckParameter?.updateDate),
                  '-',
                )}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Kanit',
                      fontSize: 22.0,
                    ),
              ),
              Text(
                'รายละเอียด(ออก) : ${valueOrDefault<String>(
                  widget.timeCheckParameter?.detailOut,
                  '-',
                )}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Kanit',
                      fontSize: 22.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context, true);
                        },
                        text: 'ตกลง',
                        options: FFButtonOptions(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
