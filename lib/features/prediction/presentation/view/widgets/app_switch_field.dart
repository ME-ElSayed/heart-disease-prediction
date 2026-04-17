import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';

class AppSwitchField extends StatelessWidget {
  final String label;
  final String? subtitle;
  final bool value;
  final void Function(bool) onChanged;

  const AppSwitchField({
    super.key,
    required this.label,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyles.font14BlackMedium),
                if (subtitle != null) ...[
                  SizedBox(height: 2.h),
                  Text(subtitle!, style: TextStyles.font12GreyRegular),
                ],
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primary,
            activeTrackColor: AppColors.primaryFixed,
            inactiveThumbColor: AppColors.outline,
            inactiveTrackColor: AppColors.surfaceContainerHigh,
          ),
        ],
      ),
    );
  }
}
