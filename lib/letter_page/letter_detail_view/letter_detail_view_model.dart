import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'letter_detail_view_widget.dart' show LetterDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LetterDetailViewModel extends FlutterFlowModel<LetterDetailViewWidget> {
  ///  Local state fields for this component.

  int? totalLeaveDay = 1;

  int? indexDay = 0;

  DateTime? dateLeave;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm;
  // Stores action output result for [Action Block - confirmBlock] action in Button widget.
  bool? isConfirm2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
