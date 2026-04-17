import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/app_validator.dart';
import 'package:heart_disease_prediction/core/helper/form_showcase_keys.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/resting_blood_pressure_showcase.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/input_field.dart';
import 'package:showcaseview/showcaseview.dart';

class NumericMedicalDataSection extends StatelessWidget {
  final TextEditingController bpController;
  final TextEditingController cholController;
  final TextEditingController heartRateController;
  final TextEditingController oldpeakController;
  final FormShowcaseKeys showcaseKeys;

  const NumericMedicalDataSection({
    super.key,
    required this.bpController,
    required this.cholController,
    required this.heartRateController,
    required this.oldpeakController, required this.showcaseKeys,
   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RestingBloodPressureShowcase(
                restingBpKey: showcaseKeys.restingBp,
                child: AppInputField(
                  label: 'Resting BP',
                  hint: '120',
                  controller: bpController,
                  keyboardType: TextInputType.number,
                  suffix: 'mmHg',
                  validator: (v) => fieldValidator(v, FieldType.restingBP),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Showcase(
                key: showcaseKeys.cholesterol,
                title: '🧪 Cholesterol',
                description:
                    'Serum cholesterol in mg/dl.\n• Normal: < 200\n• Borderline: 200–239\n• High: ≥ 240',
                tooltipBackgroundColor: Colors.teal,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                descTextStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
                child: AppInputField(
                  label: 'Cholesterol',
                  hint: '200',
                  controller: cholController,
                  keyboardType: TextInputType.number,
                  suffix: 'mg/dl',
                  validator: (v) => fieldValidator(v, FieldType.cholesterol),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Showcase(
                key: showcaseKeys.maxHeartRate,
                title: '💓 Max Heart Rate',
                description:
                    'Highest heart rate during exercise.\n• Typical range: 60–202 bpm\n• Formula: 220 − your age',
                tooltipBackgroundColor: Colors.teal,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                descTextStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
                child: AppInputField(
                  label: 'Max Heart Rate',
                  hint: '150',
                  controller: heartRateController,
                  keyboardType: TextInputType.number,
                  suffix: 'bpm',
                  validator: (v) => fieldValidator(v, FieldType.maxHeartRate),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Showcase(
                key: showcaseKeys.stDepression,
                title: '📉 ST Depression',
                description:
                    'ST segment drop on ECG during exercise vs. rest.\n• Normal: 0.0\n• Abnormal: > 1.0\nFound in your ECG report.',
                tooltipBackgroundColor: Colors.teal,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                descTextStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
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
            ),
          ],
        ),
      ],
    );
  }
}
