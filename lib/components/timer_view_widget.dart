import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_view_model.dart';
export 'timer_view_model.dart';

class TimerViewWidget extends StatefulWidget {
  const TimerViewWidget({
    super.key,
    required this.milliseconds,
  });

  final int? milliseconds;

  @override
  State<TimerViewWidget> createState() => _TimerViewWidgetState();
}

class _TimerViewWidgetState extends State<TimerViewWidget> {
  late TimerViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tmpMilliseconds = widget!.milliseconds;
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.tmpMilliseconds = _model.tmpMilliseconds! + 1000;
          _model.duration = _model.tmpMilliseconds?.toString();
          setState(() {});
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        _model.duration,
        '-',
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Kanit',
            fontSize: 22.0,
            letterSpacing: 0.0,
          ),
    );
  }
}
