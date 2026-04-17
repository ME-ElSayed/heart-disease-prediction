import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Major Vessels (0-3)', style: TextStyles.font12BlackMedium),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.surfaceContainerHigh,
                    thumbColor: AppColors.primary,
                    overlayColor:
                        AppColors.primary.withValues(alpha: 0.12),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: formState.ca.toDouble(),
                    min: 0,
                    max: 3,
                    divisions: 3,
                    onChanged: (value) => cubit.updateCa(value.toInt()),
                  ),
                ),
              ),
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    formState.ca.toString(),
                    style: TextStyles.font16BlackSemiBold.copyWith(
                      color: AppColors.primary,
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