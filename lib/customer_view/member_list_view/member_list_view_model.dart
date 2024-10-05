import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/customer_view/member_detail_view/member_detail_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'member_list_view_widget.dart' show MemberListViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MemberListViewModel extends FlutterFlowModel<MemberListViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  int totalMember = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in MemberListView widget.
  int? totalMemberResult;
  // Stores action output result for [Bottom Sheet - MemberDetailView] action in Container widget.
  String? isUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
