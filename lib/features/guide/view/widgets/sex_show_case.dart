import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class SexShowCase extends StatelessWidget {
  final Widget child;
  final GlobalKey sexKey;
  const SexShowCase({super.key, required this.child, required this.sexKey});

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: sexKey,
      title: 'Biological Sex',
      description:
          'Select your biological sex.\nThis affects heart disease risk calculations.',
      tooltipBackgroundColor: Colors.indigo,
      titleTextStyle: TextStyles.font24BlackBold,
      descTextStyle: TextStyles.font20BlackSemiBold,
      child: child,
    );
  }
}
