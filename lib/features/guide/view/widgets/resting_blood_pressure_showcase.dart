import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class RestingBloodPressureShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey restingBpKey;
  const RestingBloodPressureShowcase({super.key, required this.child, required this.restingBpKey});

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: restingBpKey,
      title: 'Resting Blood Pressure',
      description:
          'Measured in mmHg at rest.\n• Normal: 90–120\n• High: above 130',
      tooltipBackgroundColor: Colors.teal,
     titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
      child: child,
    );
  }
}
