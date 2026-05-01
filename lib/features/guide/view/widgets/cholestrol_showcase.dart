import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class CholestrolShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey cholesterolKey;
  const CholestrolShowcase({
    super.key,
    required this.child,
    required this.cholesterolKey,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: cholesterolKey,
      title: ' Cholesterol',
      description:
          'Serum cholesterol in mg/dl.\n• Normal: < 200\n• Borderline: 200–239\n• High: ≥ 240',
      tooltipBackgroundColor: Colors.teal,
      titleTextStyle: TextStyles.font18BlackSemiBold,
      descTextStyle: TextStyles.font16BlackSemiBold,
      child: child,
    );
  }
}
