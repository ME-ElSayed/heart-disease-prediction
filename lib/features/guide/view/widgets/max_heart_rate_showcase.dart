import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class MaxHeartRateShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey maxHeartRateKey;
  const MaxHeartRateShowcase({
    super.key,
    required this.child,
    required this.maxHeartRateKey,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: maxHeartRateKey,
      title: 'Max Heart Rate',
      description:
          'Highest heart rate during exercise.\n• Typical range: 60–202 bpm\n• Formula: 220 − your age',
      tooltipBackgroundColor: Colors.teal,
      titleTextStyle: TextStyles.font18BlackSemiBold,
      descTextStyle: TextStyles.font16BlackSemiBold,
      child: child,
    );
  }
}
