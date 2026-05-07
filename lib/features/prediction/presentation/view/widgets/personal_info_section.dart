import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/app_validator.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/age_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/sex_show_case.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_segmented_control.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/section_header.dart';

import 'input_field.dart';

class PersonalInfoSection extends StatelessWidget {
  final TextEditingController ageController;
  final String? selectedSex;
  final void Function(String) onSexChanged;
  final GlobalKey ageKey; //  add
  final GlobalKey sexKey; //  add

  const PersonalInfoSection({
    super.key,
    required this.ageController,
    required this.selectedSex,
    required this.onSexChanged,
    required this.ageKey,
    required this.sexKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
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
          // ... your header row unchanged ...
          SectionHeader(
            content: "Personal Information",
            icon: Icons.person_outlined,
          ),
          SizedBox(height: 20.h),

          //  Age field
          AgeShowcase(
            ageKey: ageKey,
            child: AppInputField(
              label: 'Age',
              hint: 'Enter your age',
              controller: ageController,
              keyboardType: TextInputType.number,
              suffix: 'years',
              validator: (value) => fieldValidator(value, FieldType.age),
            ),
          ),

          SizedBox(height: 16.h),

          //  Sex field
          SexShowCase(
            sexKey: sexKey,
            child: AppSegmentedControl(
              label: 'Sex',
              options: const ['Male', 'Female'],
              selected: selectedSex,
              onSelected: onSexChanged,
            ),
          ),
        ],
      ),
    );
  }
}
