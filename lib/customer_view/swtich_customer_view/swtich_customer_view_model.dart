import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/customer_view/customer_member_view/customer_member_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'swtich_customer_view_widget.dart' show SwtichCustomerViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SwtichCustomerViewModel
    extends FlutterFlowModel<SwtichCustomerViewWidget> {
  ///  Local state fields for this component.

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
