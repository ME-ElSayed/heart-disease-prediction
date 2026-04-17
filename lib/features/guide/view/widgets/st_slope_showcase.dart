import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class StSlopeShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey stSlopeKey;
  const StSlopeShowcase({
    super.key,
    required this.child,
    required this.stSlopeKey,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: stSlopeKey,
      title: 'ST Slope',
      description:
          'Shape of the ST segment during peak exercise:\n'
          '• Upsloping — generally favorable\n'
          '• Flat — may indicate ischemia\n'
          '• Downsloping — higher risk indicator',
      tooltipBackgroundColor: Colors.deepOrange,
      titleTextStyle: TextStyles.font18BlackSemiBold,
      descTextStyle: TextStyles.font16BlackSemiBold,
      child: child,
    );
  }
}
