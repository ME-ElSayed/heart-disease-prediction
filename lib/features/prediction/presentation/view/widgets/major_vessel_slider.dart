import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_cubit.dart';
import 'package:heart_disease_prediction/features/prediction/presentation/cubits/healthInput/health_input_state.dart';

class MajorVesselsSlider extends StatelessWidget {
  const MajorVesselsSlider({
    super.key,
    required this.formState,
    required this.cubit,
  });

  final HealthInputFormState formState;
  final HealthInputCubit cubit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Major Vessels (0-3)',
          style: TextStyles.font12BlackMedium.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Slider(
                  value: formState.ca.toDouble(),
                  min: 0,
                  max: 3,
                  divisions: 3,
                  onChanged: (value) => cubit.updateCa(value.toInt()),
                ),
              ),
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    formState.ca.toString(),
                    style: TextStyles.font16BlackSemiBold.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
