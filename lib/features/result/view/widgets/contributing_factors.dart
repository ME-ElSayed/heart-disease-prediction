import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/prediction_input_data.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/factor_bar.dart';

class ContributingFactors extends StatefulWidget {
  final PredictionInputData inputData;
  const ContributingFactors({super.key, required this.inputData});

  @override
  State<ContributingFactors> createState() => _ContributingFactorsState();
}

class _ContributingFactorsState extends State<ContributingFactors> {
  @override
  Widget build(BuildContext context) {
    final int bp = widget.inputData.trestbps;
    final int chol = widget.inputData.chol;
    final int hr = widget.inputData.thalch;
    final double oldpeak = widget.inputData.oldpeak;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.secondaryFixed,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.analytics_outlined,
                  color: AppColors.secondary,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Contributing Factors',
                  style: TextStyles.font18BlackSemiBold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          FactorBar(
            label: 'Blood Pressure',
            value: '$bp mmHg',
            percentage: (bp / 200).clamp(0.0, 1.0),
            color: bp > 140 ? AppColors.tertiary : AppColors.primary,
            icon: Icons.speed_rounded,
          ),
          FactorBar(
            label: 'Cholesterol',
            value: '$chol mg/dl',
            percentage: (chol / 400).clamp(0.0, 1.0),
            color: chol > 240 ? AppColors.tertiary : AppColors.warningAmber,
            icon: Icons.water_drop_rounded,
          ),
          FactorBar(
            label: 'Max Heart Rate',
            value: '$hr bpm',
            percentage: (hr / 220).clamp(0.0, 1.0),
            color: AppColors.secondary,
            icon: Icons.favorite_rounded,
          ),
          FactorBar(
            label: 'ST Depression',
            value: '${oldpeak.toStringAsFixed(1)} mm',
            percentage: (oldpeak / 6).clamp(0.0, 1.0),
            color: oldpeak > 2 ? AppColors.tertiary : AppColors.successGreen,
            icon: Icons.show_chart_rounded,
          ),
        ],
      ),
    );
  }
}


