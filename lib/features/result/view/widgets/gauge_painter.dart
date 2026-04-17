import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/core/utils/app_colors.dart';

class GaugePainter extends CustomPainter {
  final double progress;
  final bool isHighRisk;

  GaugePainter({required this.progress, required this.isHighRisk});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;

    // Background track
    final trackPaint = Paint()
      ..color = AppColors.surfaceContainerHigh
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi * 0.75,
      math.pi * 1.5,
      false,
      trackPaint,
    );

    // Progress arc
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        startAngle: -math.pi * 0.75,
        endAngle: math.pi * 0.75,
        colors: isHighRisk
            ? [AppColors.warningAmber, AppColors.tertiary]
            : [AppColors.primaryFixedDim, AppColors.successGreen],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi * 0.75,
      math.pi * 1.5 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
