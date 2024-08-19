import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'create_customer_view_widget.dart' show CreateCustomerViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCustomerViewModel
    extends FlutterFlowModel<CreateCustomerViewWidget> {
  ///  State fields for stateful widgets in this component.

  var qrCodeResult = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
