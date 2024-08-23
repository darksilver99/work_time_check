import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/component/join_and_create_customer_text/join_and_create_customer_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final buttonTprtq5pi = GlobalKey();
final columnN67hyokg = GlobalKey();

/// joinAndCreateCustomer
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: buttonTprtq5pi,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => JoinAndCreateCustomerTextWidget(
              text: 'ท่าสามารถเข้าร่วมองค์กรหรือสร้างองค์กรได้ที่นี่',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: columnN67hyokg,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => JoinAndCreateCustomerTextWidget(
              text: 'หรือตรวจสอบองค์กรอื่นๆของท่านได้ที่นี่',
            ),
          ),
        ],
      ),
    ];
