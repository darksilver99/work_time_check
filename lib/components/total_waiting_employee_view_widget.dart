import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'total_waiting_employee_view_model.dart';
export 'total_waiting_employee_view_model.dart';

class TotalWaitingEmployeeViewWidget extends StatefulWidget {
  const TotalWaitingEmployeeViewWidget({
    super.key,
    required this.companyParameter,
  });

  final CompanyListRecord? companyParameter;

  @override
  State<TotalWaitingEmployeeViewWidget> createState() =>
      _TotalWaitingEmployeeViewWidgetState();
}

class _TotalWaitingEmployeeViewWidgetState
    extends State<TotalWaitingEmployeeViewWidget> {
  late TotalWaitingEmployeeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalWaitingEmployeeViewModel());
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
              'status',
              isEqualTo: 0,
            )
            .where(
              'company_ref',
              isEqualTo: widget.companyParameter?.reference,
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
        int containerCount = snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Visibility(
            visible: containerCount > 0,
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).error,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    containerCount.toString(),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kanit',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
