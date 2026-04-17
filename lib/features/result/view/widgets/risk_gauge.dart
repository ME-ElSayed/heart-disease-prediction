import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/circular_gauge.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class RiskGauge extends StatefulWidget {
  final double probability;
  final bool hasHeartDisease;

  const RiskGauge({
    super.key,
    required this.probability,
    required this.hasHeartDisease,
  });

  @override
  State<RiskGauge> createState() => _RiskGaugeState();
}

class _RiskGaugeState extends State<RiskGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.probability,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isHighRisk = widget.hasHeartDisease;

    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Risk Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isHighRisk
                  ? AppColors.errorContainer
                  : AppColors.successGreenLight,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isHighRisk
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                  size: 18.sp,
                  color: isHighRisk
                      ? AppColors.onErrorContainer
                      : AppColors.successGreen,
                ),
                SizedBox(width: 6.w),
                Text(
                  isHighRisk ? 'High Risk Detected' : 'Low Risk',
                  style: TextStyles.font14BlackMedium.copyWith(
                    color: isHighRisk
                        ? AppColors.onErrorContainer
                        : AppColors.successGreen,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Circular Gauge
          CircularGauge(animation: _animation, isHighRisk: isHighRisk),
          SizedBox(height: 24.h),

          // Description
          Text(
            isHighRisk
                ? 'Our AI model indicates elevated cardiovascular risk. We strongly recommend consulting with a healthcare professional.'
                : 'Your cardiovascular risk appears to be within normal range. Continue maintaining a healthy lifestyle.',
            textAlign: TextAlign.center,
            style: TextStyles.font18Regular.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
