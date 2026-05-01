import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_colors.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:heart_disease_prediction/features/prediction/data/model/top_features.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/factor_bar.dart';

class ContributingFactors extends StatelessWidget {
  final List<TopFeature> topFeatures;

  const ContributingFactors({super.key, required this.topFeatures});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Normalise bar widths relative to the largest absolute impact.
    final maxImpact = topFeatures
        .map((f) => f.impact.abs())
        .fold(0.0, (a, b) => a > b ? a : b);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: theme.brightness == Brightness.dark ? 0.24 : 0.04,
            ),
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
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.analytics_outlined,
                  color: colorScheme.secondary,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Contributing Factors',
                  style: TextStyles.font18BlackSemiBold.copyWith(
                    color: colorScheme.onSurface,
                  ),
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
