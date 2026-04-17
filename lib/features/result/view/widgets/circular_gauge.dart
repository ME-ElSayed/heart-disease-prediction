import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/gauge_painter.dart';

class CircularGauge extends StatelessWidget {
  const CircularGauge({
    super.key,
    required Animation<double> animation,
    required this.isHighRisk,
  }) : _animation = animation;

  final Animation<double> _animation;
  final bool isHighRisk;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: 200.w,
          height: 200.w,
          child: CustomPaint(
            painter: GaugePainter(
              progress: _animation.value,
              isHighRisk: isHighRisk,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(_animation.value * 100).toInt()}%',
                    style: TextStyles.font40BlackExtraBold.copyWith(
                      color: isHighRisk
                          ? AppColors.tertiary
                          : AppColors.successGreen,
                    ),
                  ),
                  Text('probability', style: TextStyles.font16BlackMedium),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
