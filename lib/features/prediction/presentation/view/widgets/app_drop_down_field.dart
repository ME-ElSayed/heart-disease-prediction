import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;

  const AppDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font12BlackMedium),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: DropdownButtonFormField<T>(
            initialValue: value,
            items: items
                .map((item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        itemLabel(item),
                        style: TextStyles.font14BlackRegular,
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              border: InputBorder.none,
            ),
            dropdownColor: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12.r),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.onSurfaceVariant,
              size: 22.sp,
            ),
          ),
        ),
      ],
    );
  }
}

