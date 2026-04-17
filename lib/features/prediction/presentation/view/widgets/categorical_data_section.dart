import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/form_showcase_keys.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/chest_pain_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/resting_ecg_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/st_slope_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/thalassemia_showcase.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_drop_down_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_segmented_control.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_switch_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/major_vessel_slider.dart';
import 'package:showcaseview/showcaseview.dart';

class CategoricalDataSection extends StatelessWidget {
  final HealthInputFormState formState;
  final HealthInputCubit cubit;
 final FormShowcaseKeys showcaseKeys;

  const CategoricalDataSection({
    super.key,
    required this.formState,
    required this.cubit, required this.showcaseKeys, 
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChestPainShowcase(
          chestPainKey: showcaseKeys.chestPain,
          child: AppDropdownField<String>(
            label: 'Chest Pain Type',
            value: formState.selectedCp,
            items: const [
              'typical angina',
              'atypical angina',
              'non-anginal',
              'asymptomatic',
            ],
            itemLabel: (item) => item[0].toUpperCase() + item.substring(1),
            onChanged: cubit.updateCp,
          ),
        ),
        SizedBox(height: 16.h),

        RestingEcgShowcase(
          restingEcgKey: showcaseKeys.restingEcg,
          child: AppDropdownField<String>(
            label: 'Resting ECG Results',
            value: formState.selectedRestecg,
            items: const ['normal', 'stt abnormality', 'lv hypertrophy'],
            itemLabel: (item) => item[0].toUpperCase() + item.substring(1),
            onChanged: cubit.updateRestecg,
          ),
        ),
        SizedBox(height: 16.h),

        StSlopeShowcase(
          stSlopeKey: showcaseKeys.stSlope,
          child: AppSegmentedControl(
            label: 'ST Slope',
            options: const ['upsloping', 'flat', 'downsloping'],
            selected: formState.selectedSlope,
            onSelected: cubit.updateSlope,
          ),
        ),
        SizedBox(height: 16.h),

        ThalassemiaShowcase(
          thalKey: showcaseKeys.thal,
          child: AppDropdownField<String>(
            label: 'Thalassemia',
            value: formState.selectedThal,
            items: const ['normal', 'fixed defect', 'reversable defect'],
            itemLabel: (item) => item[0].toUpperCase() + item.substring(1),
            onChanged: cubit.updateThal,
        )),
        SizedBox(height: 16.h),

        Showcase(
          key: showcaseKeys.vessels,
          title: '🫀 Major Vessels',
          description:
              'Number of major coronary vessels visible on fluoroscopy (0–3).\n• 0 = no blockage\n• 3 = all vessels affected',
          tooltipBackgroundColor: Colors.deepOrange,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          descTextStyle: const TextStyle(color: Colors.white70, fontSize: 13),
          child: MajorVesselsSlider(formState: formState, cubit: cubit),
        ),
        SizedBox(height: 16.h),

        Showcase(
          key: showcaseKeys.fbs,
          title: '🩸 Fasting Blood Sugar',
          description:
              'Is your blood sugar > 120 mg/dl after fasting 8+ hours?\n• ON = Yes (may indicate diabetes)\n• OFF = No',
          tooltipBackgroundColor: Colors.purple,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          descTextStyle: const TextStyle(color: Colors.white70, fontSize: 13),
          child: AppSwitchField(
            label: 'Fasting Blood Sugar > 120 mg/dl',
            subtitle: 'Is fasting blood sugar above 120?',
            value: formState.fbs,
            onChanged: cubit.updateFbs,
          ),
        ),
        SizedBox(height: 12.h),

        Showcase(
          key: showcaseKeys.exang,
          title: '🏃 Exercise-Induced Angina',
          description:
              'Do you get chest pain or tightness during physical activity?\n• ON = Yes\n• OFF = No',
          tooltipBackgroundColor: Colors.purple,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          descTextStyle: const TextStyle(color: Colors.white70, fontSize: 13),
          child: AppSwitchField(
            label: 'Exercise-Induced Angina',
            subtitle: 'Chest pain during exercise?',
            value: formState.exang,
            onChanged: cubit.updateExang,
          ),
        ),
      ],
    );
  }
}
