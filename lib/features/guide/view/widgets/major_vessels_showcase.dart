import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class MajorVesselsShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey majorVesselsKey;
  const MajorVesselsShowcase({super.key, required this.child, required this.majorVesselsKey});

  @override
  Widget build(BuildContext context) {
    return  Showcase(
          key: majorVesselsKey,
          title: '🫀 Major Vessels',
          description:
              'Number of major coronary vessels visible on fluoroscopy (0–3).\n• 0 = no blockage\n• 3 = all vessels affected',
          tooltipBackgroundColor: Colors.deepOrange,
            titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child: child,
          );
  }
}