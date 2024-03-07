import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'still_no_company_view_model.dart';
export 'still_no_company_view_model.dart';

class StillNoCompanyViewWidget extends StatefulWidget {
  const StillNoCompanyViewWidget({super.key});

  @override
  State<StillNoCompanyViewWidget> createState() =>
      _StillNoCompanyViewWidgetState();
}

class _StillNoCompanyViewWidgetState extends State<StillNoCompanyViewWidget> {
  late StillNoCompanyViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StillNoCompanyViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.info_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 48.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'คุณยังไม่ได้อยู่ในองค์กร',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Kanit',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 18.0,
                  ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed('JoinCompanyPage');
                },
                text: 'เข้าร่วมองค์กร',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Kanit',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 18.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
