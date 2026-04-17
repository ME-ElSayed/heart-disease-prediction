import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class ThalassemiaShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey thalKey;
  const ThalassemiaShowcase({super.key, required this.child, required this.thalKey});

  @override
  Widget build(BuildContext context) {
    return Showcase(
          key: thalKey,
          title: 'Thalassemia',
          description:
              'Blood disorder affecting hemoglobin:\n'
              '• Normal — no defect\n'
              '• Fixed Defect — permanent damage\n'
              '• Reversible Defect — stress-induced, can recover',
          tooltipBackgroundColor: Colors.deepOrange,
            titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child: child,
          );
  }
}