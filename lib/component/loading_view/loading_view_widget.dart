import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_view_model.dart';
export 'loading_view_model.dart';

class LoadingViewWidget extends StatefulWidget {
  const LoadingViewWidget({super.key});

  @override
  State<LoadingViewWidget> createState() => _LoadingViewWidgetState();
}

class _LoadingViewWidgetState extends State<LoadingViewWidget> {
  late LoadingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/jsons/Animation_-_1702952235302.json',
              width: 120.0,
              height: 120.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ],
        ),
      ],
    );
  }
}
