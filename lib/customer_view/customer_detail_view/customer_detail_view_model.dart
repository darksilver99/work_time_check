import '/backend/backend.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/components/promotion_view_widget.dart';
import '/customer_view/customer_q_r_code_view/customer_q_r_code_view_widget.dart';
import '/customer_view/member_list_view/member_list_view_widget.dart';
import '/customer_view/select_month_and_year_to_export_view/select_month_and_year_to_export_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'customer_detail_view_widget.dart' show CustomerDetailViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerDetailViewModel
    extends FlutterFlowModel<CustomerDetailViewWidget> {
  ///  Local state fields for this component.

  DateTime? currentDate;

  List<FFUploadedFile> tmpPhotoList = [];
  void addToTmpPhotoList(FFUploadedFile item) => tmpPhotoList.add(item);
  void removeFromTmpPhotoList(FFUploadedFile item) => tmpPhotoList.remove(item);
  void removeAtIndexFromTmpPhotoList(int index) => tmpPhotoList.removeAt(index);
  void insertAtIndexInTmpPhotoList(int index, FFUploadedFile item) =>
      tmpPhotoList.insert(index, item);
  void updateTmpPhotoListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpPhotoList[index] = updateFn(tmpPhotoList[index]);

  bool isExpire = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - checkIsCustomerExpire] action in CustomerDetailView widget.
  bool? checkIsExpire;

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
