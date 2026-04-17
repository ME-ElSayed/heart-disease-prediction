import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.secondaryFixed,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.monitor_heart_outlined,
            color: AppColors.secondary,
            size: 22.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Text('Health Metrics', style: TextStyles.font18BlackSemiBold),
      ],
    );
  }
}
