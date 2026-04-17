import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/top_features.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/factor_bar.dart';

class ContributingFactors extends StatelessWidget {
  final List<TopFeature> topFeatures;

  const ContributingFactors({super.key, required this.topFeatures});

  @override
  Widget build(BuildContext context) {
    // Normalise bar widths relative to the largest absolute impact.
    final maxImpact = topFeatures
        .map((f) => f.impact.abs())
        .fold(0.0, (a, b) => a > b ? a : b);

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
          ...topFeatures.map((feature) {
            final isRiskIncreasing = feature.impact > 0;
            final percentage = maxImpact == 0
                ? 0.0
                : (feature.impact.abs() / maxImpact);
            final color = isRiskIncreasing
                ? AppColors
                      .tertiary // raises risk  → warning colour
                : AppColors.primary; // lowers risk  → safe colour

            return FactorBar(
              label: feature.label,
              value: isRiskIncreasing ? '▲ risk' : '▼ risk',
              percentage: percentage.clamp(0.0, 1.0),
              color: color,
              icon: feature.icon,
            );
          }),
        ],
      ),
    );
  }
}
