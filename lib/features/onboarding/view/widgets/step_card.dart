import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_colors.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:heart_disease_prediction/core/theme/font_weight_helper.dart';

class StepCard extends StatelessWidget {
  final String stepNumber;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;

  const StepCard({
    super.key,
    required this.stepNumber,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step icon
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 26.sp),
            ),
          ),
          SizedBox(width: 16.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'STEP $stepNumber',
                        style: TextStyles.font12GreyRegular.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(title, style: TextStyles.font20BlackSemiBold),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyles.font16BlackMedium.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
