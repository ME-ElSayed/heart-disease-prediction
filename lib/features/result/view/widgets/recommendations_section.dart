import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/features/result/data/model/recommendation_model.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/recommendation_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RecommendationsSection extends StatelessWidget {
  final bool isHighRisk;

  const RecommendationsSection({super.key, required this.isHighRisk});

  @override
  Widget build(BuildContext context) {
    final recommendations = isHighRisk
        ? [
            RecommendationModel(
              icon: Icons.local_hospital_rounded,
              title: 'Consult a Cardiologist',
              description:
                  'Schedule an appointment with a heart specialist for a comprehensive evaluation.',
              color: AppColors.tertiary,
            ),
            RecommendationModel(
              icon: Icons.restaurant_rounded,
              title: 'Heart-Healthy Diet',
              description:
                  'Adopt a Mediterranean or DASH diet low in saturated fats and sodium.',
              color: AppColors.warningAmber,
            ),
            RecommendationModel(
              icon: Icons.fitness_center_rounded,
              title: 'Regular Exercise',
              description:
                  'Aim for at least 150 minutes of moderate aerobic activity per week.',
              color: AppColors.primary,
            ),
            RecommendationModel(
              icon: Icons.monitor_heart_outlined,
              title: 'Monitor Vitals',
              description:
                  'Track your blood pressure and cholesterol regularly.',
              color: AppColors.secondary,
            ),
          ]
        : [
            RecommendationModel(
              icon: Icons.thumb_up_rounded,
              title: 'Maintain Healthy Habits',
              description:
                  'Continue your current lifestyle choices that promote heart health.',
              color: AppColors.successGreen,
            ),
            RecommendationModel(
              icon: Icons.calendar_month_rounded,
              title: 'Regular Check-ups',
              description:
                  'Schedule annual cardiovascular screenings for ongoing monitoring.',
              color: AppColors.primary,
            ),
            RecommendationModel(
              icon: Icons.self_improvement_rounded,
              title: 'Manage Stress',
              description:
                  'Practice mindfulness, meditation, or other stress-reduction techniques.',
              color: AppColors.secondary,
            ),
          ];

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
                  color: AppColors.primaryFixed,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.lightbulb_outline_rounded,
                  color: AppColors.primary,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Recommendations',
                    style: TextStyles.font24BlackBold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ...recommendations.map((rec) => RecommendationItem(rec: rec)),
        ],
      ),
    );
  }
}
