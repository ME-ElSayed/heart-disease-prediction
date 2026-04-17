import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_drop_down_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_segmented_control.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/app_switch_field.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/major_vessel_slider.dart';

class CategoricalMedicalDataSection extends StatelessWidget {
  const CategoricalMedicalDataSection({
    super.key,
    required this.formState,
    required this.cubit,
  });

  final HealthInputFormState formState;
  final HealthInputCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
        AppDropdownField<String>(
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
              SizedBox(height: 16.h),
    
              AppDropdownField<String>(
     label: 'Resting ECG Results',
     value: formState.selectedRestecg,
     items: const ['normal', 'stt abnormality', 'lv hypertrophy'],
     itemLabel: (item) => item[0].toUpperCase() + item.substring(1),
     onChanged: cubit.updateRestecg,
              ),
              SizedBox(height: 16.h),
    
              AppSegmentedControl(
     label: 'ST Slope',
     options: const ['upsloping', 'flat', 'downsloping'],
     selected: formState.selectedSlope,
     onSelected: cubit.updateSlope,
              ),
              SizedBox(height: 16.h),
    
              AppDropdownField<String>(
     label: 'Thalassemia',
     value: formState.selectedThal,
     items: const ['normal', 'fixed defect', 'reversable defect'],
     itemLabel: (item) => item[0].toUpperCase() + item.substring(1),
     onChanged: cubit.updateThal,
              ),
              SizedBox(height: 16.h),
    
              // ── Major Vessels Slider ──
              MajorVesselsSlider(formState: formState, cubit: cubit),
              SizedBox(height: 16.h),
    
              AppSwitchField(
     label: 'Fasting Blood Sugar > 120 mg/dl',
     subtitle: 'Is fasting blood sugar above 120?',
     value: formState.fbs,
     onChanged: cubit.updateFbs,
              ),
              SizedBox(height: 12.h),
    
              AppSwitchField(
     label: 'Exercise-Induced Angina',
     subtitle: 'Chest pain during exercise?',
     value: formState.exang,
     onChanged: cubit.updateExang,
              ),
     ],
    );
  }
}

