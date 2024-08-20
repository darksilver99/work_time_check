import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/customer_view/member_view/member_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'customer_member_view_widget.dart' show CustomerMemberViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerMemberViewModel
    extends FlutterFlowModel<CustomerMemberViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - confirmBlock] action in ConditionalBuilder widget.
  bool? isConfirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
