import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'join_and_create_customer_text_model.dart';
export 'join_and_create_customer_text_model.dart';

class JoinAndCreateCustomerTextWidget extends StatefulWidget {
  const JoinAndCreateCustomerTextWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<JoinAndCreateCustomerTextWidget> createState() =>
      _JoinAndCreateCustomerTextWidgetState();
}

class _JoinAndCreateCustomerTextWidgetState
    extends State<JoinAndCreateCustomerTextWidget> {
  late JoinAndCreateCustomerTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JoinAndCreateCustomerTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).info,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
        child: Text(
          valueOrDefault<String>(
            widget!.text,
            '-',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Kanit',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
