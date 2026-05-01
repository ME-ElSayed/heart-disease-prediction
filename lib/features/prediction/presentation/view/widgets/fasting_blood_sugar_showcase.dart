import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class FastingBloodSugarShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey fastingBloodSugarKey;
  const FastingBloodSugarShowcase({super.key, required this.child, required this.fastingBloodSugarKey});

  @override
  Widget build(BuildContext context) {
    return  Showcase(
          key: fastingBloodSugarKey,
          title: 'Fasting Blood Sugar',
          description:
              'Is your blood sugar > 120 mg/dl after fasting 8+ hours?\n• ON = Yes (may indicate diabetes)\n• OFF = No',
          tooltipBackgroundColor: Colors.purple,
          titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child: child,
          );
  }
}