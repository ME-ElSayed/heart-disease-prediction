import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class AgeShowcase extends StatelessWidget {
  final GlobalKey ageKey;
  final Widget child;
  const AgeShowcase({super.key, required this.ageKey, required this.child});

  @override
  Widget build(BuildContext context) {
    return Showcase(
            key: ageKey,
            title: ' Age',
            description: 'Enter your age in years.\nValid range: 1 – 120.',
            tooltipBackgroundColor: AppColors.primary,
            titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child:child);
  }
}