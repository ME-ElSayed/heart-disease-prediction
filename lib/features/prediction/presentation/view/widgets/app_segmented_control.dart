import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';

class AppSegmentedControl extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selected;
  final void Function(String) onSelected;

  const AppSegmentedControl({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font12BlackMedium.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(4.w),
          child: Row(
            children: options.map((option) {
              final isSelected = option == selected;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onSelected(option),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.surfaceContainerLowest
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: theme.brightness == Brightness.dark
                                      ? 0.24
                                      : 0.06,
                                ),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          option,
                          style: isSelected
                              ? TextStyles.font14BlackMedium.copyWith(
                                  color: colorScheme.primary,
                                )
                              : TextStyles.font14GreyRegular.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
