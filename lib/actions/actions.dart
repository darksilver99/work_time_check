import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import '/component/info_custom_view/info_custom_view_widget.dart';
import '/customer_view/join_customer_view/join_customer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future<bool?> confirmBlock(
  BuildContext context, {
  required String? title,
  String? detail,
}) async {
  bool? isConfrim;

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ConfirmCustomViewWidget(
            title: title!,
            detail: detail,
          ),
        ),
      );
    },
  ).then((value) => isConfrim = value);

  if ((isConfrim != null) && isConfrim!) {
    return true;
  }

  return false;
}

Future initConfig(BuildContext context) async {
  ConfigRecord? configResult;

  configResult = await queryConfigRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  FFAppState().configData = ConfigDataStruct(
    storeVersion: configResult?.storeVersion,
    storeIosLink: configResult?.storeIosLink,
    storeAndroidLink: configResult?.storeAndroidLink,
    policyUrl: configResult?.policyUrl,
    freeDay: configResult?.freeDay,
    paymentAlertText: configResult?.paymentAlertText,
    paymentDetailImage: configResult?.paymentDetailImage,
    promotionDetailImage: configResult?.promotionDetailImage,
    contact: configResult?.contact,
  );
}

Future initCustomer(BuildContext context) async {
  CustomerRecord? customerResult;

  if (currentUserDocument?.currentCustomerRef != null) {
    customerResult = await CustomerRecord.getDocumentOnce(
        currentUserDocument!.currentCustomerRef!);
    FFAppState().customerData = CustomDataStruct(
      expireDate: customerResult?.expireDate,
      subject: customerResult?.subject,
      customerRef: customerResult?.reference,
    );
    await action_blocks.checkIsHasKickFromCustomer(context);
  } else {
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
              title: 'ท่านยังไม่ได้อยู่ในองกรค์',
              detail: 'กรุณาเข้าร่วมองค์กรหรือสร้างองค์กร',
              status: 'warning',
            ),
          ),
        );
      },
    );

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
            child: JoinCustomerViewWidget(),
          ),
        );
      },
    );

    await actions.pushReplacement(
      context,
      null,
    );
  }
}

Future<bool?> isHasCustomerBlock(BuildContext context) async {
  if (currentUserDocument?.currentCustomerRef != null) {
    return true;
  }

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: InfoCustomViewWidget(
            title: 'ท่านยังไม่ได้อยู่ในองกรค์',
            detail: 'กรุณาเข้าร่วมองค์กรหรือสร้างองค์กร',
            status: 'warning',
          ),
        ),
      );
    },
  );

  await showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: JoinCustomerViewWidget(),
        ),
      );
    },
  );

  await actions.pushReplacement(
    context,
    null,
  );
  return false;
}

Future checkIsHasKickFromCustomer(BuildContext context) async {
  MemberListRecord? memberDoc;

  memberDoc = await queryMemberListRecordOnce(
    parent: FFAppState().customerData.customerRef,
    queryBuilder: (memberListRecord) => memberListRecord.where(
      'create_by',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (!(memberDoc != null)) {
    await currentUserReference!.update({
      ...mapToFirestore(
        {
          'current_customer_ref': FieldValue.delete(),
        },
      ),
    });
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
              title: 'คุณไม่ได้อยู่ในองค์กรนี้แล้ว',
              status: 'error',
            ),
          ),
        );
      },
    );

    FFAppState().customerData = CustomDataStruct();
    await actions.pushReplacement(
      context,
      null,
    );
  }
}
