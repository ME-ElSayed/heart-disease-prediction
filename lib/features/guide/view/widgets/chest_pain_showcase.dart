import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class ChestPainShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey chestPainKey;
  const ChestPainShowcase({
    super.key,
    required this.child,
    required this.chestPainKey,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: chestPainKey,
      title: 'Chest Pain Type',
      description:
          '• Typical Angina — chest pain from reduced blood flow\n'
          '• Atypical Angina — chest pain, not classic pattern\n'
          '• Non-Anginal — unrelated to heart\n'
          '• Asymptomatic — no chest pain at all',
      tooltipBackgroundColor: Colors.deepOrange,
      titleTextStyle: TextStyles.font18BlackSemiBold,
      descTextStyle: TextStyles.font16BlackSemiBold,
      child: child,
    );
  }
}
