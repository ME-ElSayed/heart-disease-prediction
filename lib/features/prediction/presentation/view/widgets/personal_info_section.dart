import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/app_validator.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_segmented_control.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'input_field.dart';

class PersonalInfoSection extends StatelessWidget {
  final TextEditingController ageController;
  final String? selectedSex;
  final void Function(String) onSexChanged;

  const PersonalInfoSection({
    super.key,
    required this.ageController,
    required this.selectedSex,
    required this.onSexChanged,
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
                  Icons.person_outline_rounded,
                  color: AppColors.primary,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text('Personal Information', style: TextStyles.font18BlackSemiBold),
            ],
          ),
          SizedBox(height: 20.h),
          AppInputField(
            label: 'Age',
            hint: 'Enter your age',
            controller: ageController,
            keyboardType: TextInputType.number,
            suffix: 'years',
            validator: (value) => fieldValidator(value, FieldType.age),
          ),
          SizedBox(height: 16.h),
          AppSegmentedControl(
            label: 'Sex',
            options: const ['Male', 'Female'],
            selected: selectedSex,
            onSelected: onSexChanged,
          ),
        ],
      ),
    );
  }
}
