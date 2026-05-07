import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';

class SectionHeader extends StatelessWidget {
  final String content;
  final IconData icon;
  const SectionHeader({super.key, required this.content, required this.icon});

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
          child: Icon(icon, color: colorScheme.onSurface, size: 22.sp),
        ),
        SizedBox(width: 12.w),
        Text(
          content,
          style: TextStyles.font18BlackSemiBold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
