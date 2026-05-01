import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.monitor_heart_outlined,
            color: colorScheme.secondary,
            size: 22.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          'Health Metrics',
          style: TextStyles.font18BlackSemiBold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
