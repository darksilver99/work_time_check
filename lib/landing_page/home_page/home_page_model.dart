import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/background_view/background_view_widget.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/work_time_view/work_time_view_widget.dart';
import '/components/check_in_view_widget.dart';
import '/components/check_out_view_widget.dart';
import '/components/history_view_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // Stores action output result for [Action Block - isHasCustomerBlock] action in Column widget.
  bool? isHasCustomer;
  // Stores action output result for [Custom Action - customCamera] action in Column widget.
  List<FFUploadedFile>? photoResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  TransacationListRecord? transactionDoc;
  // Stores action output result for [Action Block - confirmBlock] action in Column widget.
  bool? isConfirm;
  // Model for WorkTimeView component.
  late WorkTimeViewModel workTimeViewModel;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    workTimeViewModel = createModel(context, () => WorkTimeViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
    workTimeViewModel.dispose();
    loadingViewModel.dispose();
  }
}
