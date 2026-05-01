import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:showcaseview/showcaseview.dart';

class ExerciseInducedAnginaShowcase extends StatelessWidget {
  final Widget child;
  final GlobalKey excerciseInducedAnginaKey;

  const ExerciseInducedAnginaShowcase({super.key, required this.child, required this.excerciseInducedAnginaKey});

  @override
  Widget build(BuildContext context) {
    return  Showcase(
          key: excerciseInducedAnginaKey,
          title: ' Exercise-Induced Angina',
          description:
              'Do you get chest pain or tightness during physical activity?\n• ON = Yes\n• OFF = No',
          tooltipBackgroundColor: Colors.purple,
            titleTextStyle: TextStyles.font24BlackBold,
            descTextStyle: TextStyles.font20BlackSemiBold,
            child: child,

          
          );
  }
}