import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_colors.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/prediction_input_data.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/metric_card.dart';

class MetricCards extends StatelessWidget {
  final PredictionInputData inputData;
  const MetricCards({super.key, required this.inputData});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              MetricCard(
                title: 'Blood Pressure',
                value: inputData.trestbps.toString(),
                unit: 'mmHg',
                icon: Icons.speed_rounded,
                color: AppColors.primary,
              ),
              SizedBox(height: 12.h),
              MetricCard(
                title: 'Heart Rate',
                value: inputData.thalch.toString(),
                unit: 'bpm',
                icon: Icons.favorite_rounded,
                color: AppColors.tertiary,
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            children: [
              MetricCard(
                title: 'Cholesterol',
                value: inputData.chol.toString(),
                unit: 'mg/dl',
                icon: Icons.water_drop_rounded,
                color: AppColors.warningAmber,
              ),
              SizedBox(height: 12.h),
              MetricCard(
                title: 'ST Depression',
                value: inputData.oldpeak.toString(),
                unit: 'mm',
                icon: Icons.show_chart_rounded,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
