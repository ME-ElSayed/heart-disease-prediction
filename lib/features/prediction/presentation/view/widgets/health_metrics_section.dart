import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/Categorical_medical_data_section.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/numeric_medical_data_section.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/view/widgets/section_header.dart';

class HealthMetricsSection extends StatelessWidget {
  final TextEditingController bpController;
  final TextEditingController cholController;
  final TextEditingController heartRateController;
  final TextEditingController oldpeakController;

  final HealthInputFormState formState;
  final HealthInputCubit cubit;

  const HealthMetricsSection({
    super.key,
    required this.bpController,
    required this.cholController,
    required this.heartRateController,
    required this.oldpeakController,
    required this.formState,
    required this.cubit,
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
          SectionHeader(),
          SizedBox(height: 20.h),
          NumericMedicalDataSection(
            bpController: bpController,
            cholController: cholController,
            heartRateController: heartRateController,
            oldpeakController: oldpeakController,
          ),
          SizedBox(height: 16.h),
           CategoricalMedicalDataSection(formState: formState, cubit: cubit),
         
        ],
      ),
    );
  }
}



