import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class StDepressionShowcase extends StatelessWidget {
  final GlobalKey stDepressionKey;
  final Widget child;
  const StDepressionShowcase({
    super.key,
    required this.stDepressionKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: stDepressionKey,
      title: 'ST Depression',
      description:
          'ST segment drop on ECG during exercise vs. rest.\n• Normal: 0.0\n• Abnormal: > 1.0\nFound in your ECG report.',
      tooltipBackgroundColor: Colors.teal,
      titleTextStyle: TextStyles.font18BlackSemiBold,
      descTextStyle: TextStyles.font16BlackSemiBold,
      child: child,
    );
  }
}
