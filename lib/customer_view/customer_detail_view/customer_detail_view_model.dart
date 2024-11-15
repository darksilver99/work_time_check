import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/customer_view/customer_q_r_code_view/customer_q_r_code_view_widget.dart';
import '/customer_view/edit_customer_view/edit_customer_view_widget.dart';
import '/customer_view/member_list_view/member_list_view_widget.dart';
import '/customer_view/select_month_and_year_to_export_view/select_month_and_year_to_export_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/letter_page/letter_request_view/letter_request_view_widget.dart';
import '/payment/promotion_view/promotion_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'customer_detail_view_widget.dart' show CustomerDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerDetailViewModel
    extends FlutterFlowModel<CustomerDetailViewWidget> {
  ///  Local state fields for this component.

  DateTime? currentDate;

  bool isExpire = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - checkIsCustomerExpire] action in CustomerDetailView widget.
  bool? checkIsExpire;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Icon widget.
  String? isUpdate;
  // Stores action output result for [Action Block - confirmBlock] action in Column widget.
  bool? isConfirm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future<bool?> checkIsCustomerExpire(BuildContext context) async {
    if (getCurrentTimestamp > widget!.customerDoc!.expireDate!) {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: InfoCustomViewWidget(
                title: 'จำนวนวันใช้งานหมดแล้ว กรุณาต่ออายุการใช้งาน',
                status: 'error',
              ),
            ),
          );
        },
      );

      return true;
    } else {
      return false;
    }
  }
}
