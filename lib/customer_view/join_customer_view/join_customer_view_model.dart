import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/customer_view/create_customer_view/create_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'join_customer_view_widget.dart' show JoinCustomerViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class JoinCustomerViewModel extends FlutterFlowModel<JoinCustomerViewWidget> {
  ///  State fields for stateful widgets in this component.

  var qrCodeResult = '';
  // Stores action output result for [Custom Action - getCustomerReference] action in Button widget.
  DocumentReference? customerRefResult;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CustomerRecord? customerDocResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalMember;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}