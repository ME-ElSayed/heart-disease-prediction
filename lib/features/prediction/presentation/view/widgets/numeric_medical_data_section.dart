import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/app_validator.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/input_field.dart';

class NumericMedicalDataSection extends StatelessWidget {
  const NumericMedicalDataSection({
    super.key,
    required this.bpController,
    required this.cholController,
    required this.heartRateController,
    required this.oldpeakController,
  });

  final TextEditingController bpController;
  final TextEditingController cholController;
  final TextEditingController heartRateController;
  final TextEditingController oldpeakController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppInputField(
                label: 'Resting BP',
                hint: '120',
                controller: bpController,
                keyboardType: TextInputType.number,
                suffix: 'mmHg',
                validator: (v) => fieldValidator(v, FieldType.restingBP),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppInputField(
                label: 'Cholesterol',
                hint: '200',
                controller: cholController,
                keyboardType: TextInputType.number,
                suffix: 'mg/dl',
                validator: (v) => fieldValidator(v, FieldType.cholesterol),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        Row(
          children: [
            Expanded(
              child: AppInputField(
                label: 'Max Heart Rate',
                hint: '150',
                controller: heartRateController,
                keyboardType: TextInputType.number,
                suffix: 'bpm',
                validator: (v) => fieldValidator(v, FieldType.maxHeartRate),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppInputField(
                label: 'ST Depression',
                hint: '1.0',
                controller: oldpeakController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (v) => fieldValidator(v, FieldType.stDepression),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
