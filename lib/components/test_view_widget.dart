import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_view_model.dart';
export 'test_view_model.dart';

class TestViewWidget extends StatefulWidget {
  const TestViewWidget({super.key});

  @override
  State<TestViewWidget> createState() => _TestViewWidgetState();
}

class _TestViewWidgetState extends State<TestViewWidget> {
  late TestViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          random_data.randomInteger(000000, 999999).toString(),
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
