import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'total_employee_view_model.dart';
export 'total_employee_view_model.dart';

class TotalEmployeeViewWidget extends StatefulWidget {
  const TotalEmployeeViewWidget({
    Key? key,
    required this.companyParameter,
  }) : super(key: key);

  final CompanyListRecord? companyParameter;

  @override
  _TotalEmployeeViewWidgetState createState() =>
      _TotalEmployeeViewWidgetState();
}

class _TotalEmployeeViewWidgetState extends State<TotalEmployeeViewWidget> {
  late TotalEmployeeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalEmployeeViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryEmployeeListRecordCount(
        queryBuilder: (employeeListRecord) => employeeListRecord
            .where(
              'company_ref',
              isEqualTo: widget.companyParameter?.reference,
            )
            .where(
              'status',
              isEqualTo: 1,
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
        int textCount = snapshot.data!;
        return Text(
          'จำนวนพนักงาน ${valueOrDefault<String>(
            textCount.toString(),
            '0',
          )} คน',
          maxLines: 1,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Kanit',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 12.0,
              ),
        );
      },
    );
  }
}
