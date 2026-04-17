import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class RestingEcgShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey restingEcgKey;
  const RestingEcgShowcase({super.key, required this.child, required this.restingEcgKey});

  @override
  Widget build(BuildContext context) {
    return  Showcase(
          key: restingEcgKey,
          title: '📊 Resting ECG',
          description:
              '• Normal — no abnormalities\n'
              '• ST-T Abnormality — possible ischemia\n'
              '• LV Hypertrophy — enlarged left ventricle\n\nFound in your ECG report.',
          tooltipBackgroundColor: Colors.deepOrange,
            titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child: child,
          ); 
  }
}
