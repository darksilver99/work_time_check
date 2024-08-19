import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component/confirm_custom_view/confirm_custom_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
