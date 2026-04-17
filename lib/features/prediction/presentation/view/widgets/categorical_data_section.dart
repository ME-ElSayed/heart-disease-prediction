import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/helper/form_showcase_keys.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/chest_pain_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/major_vessels_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/resting_ecg_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/st_slope_showcase.dart';
import 'package:heart_disease_prediction/features/guide/view/widgets/thalassemia_showcase.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_drop_down_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_segmented_control.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_switch_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/exercise_induced_angina_showcase.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/fasting_blood_sugar_showcase.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/major_vessel_slider.dart';

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

        MajorVesselsShowcase(
          majorVesselsKey: showcaseKeys.vessels,
          child: MajorVesselsSlider(formState: formState, cubit: cubit),
        ),
        SizedBox(height: 16.h),

        FastingBloodSugarShowcase(
          fastingBloodSugarKey: showcaseKeys.fbs,
          child: AppSwitchField(
            label: 'Fasting Blood Sugar > 120 mg/dl',
            subtitle: 'Is fasting blood sugar above 120?',
            value: formState.fbs,
            onChanged: cubit.updateFbs,
          ),
        ),
        SizedBox(height: 12.h),

        ExerciseInducedAnginaShowcase(
          excerciseInducedAnginaKey: showcaseKeys.exang,
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
