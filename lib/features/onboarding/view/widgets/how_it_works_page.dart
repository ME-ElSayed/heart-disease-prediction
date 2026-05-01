import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/features/onboarding/view/widgets/step_card.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            // ── Title ──
            Text(
              'How It Works',
              style: TextStyles.font36BlackBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Three simple steps to assess your cardiovascular health',
              style: TextStyles.font18Regular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            StepCard(
              stepNumber: '01',
              icon: Icons.edit_note_rounded,
              iconColor: AppColors.primary,
              iconBgColor: AppColors.primaryFixed,
              title: 'Input Your Data',
              description:
                  'Enter your health metrics including blood pressure, cholesterol levels, and other vital information.',
            ),
            SizedBox(height: 16.h),
            StepCard(
              stepNumber: '02',
              icon: Icons.psychology_rounded,
              iconColor: AppColors.secondary,
              iconBgColor: AppColors.secondaryFixed,
              title: 'AI Analysis',
              description:
                  'Our machine learning model processes your data using advanced algorithms trained on clinical datasets.',
            ),
            SizedBox(height: 16.h),
            StepCard(
              stepNumber: '03',
              icon: Icons.insights_rounded,
              iconColor: AppColors.successGreen,
              iconBgColor: AppColors.successGreenLight,
              title: 'Get Results',
              description:
                  'Receive a comprehensive risk assessment with probability scores and personalized recommendations.',
            ),
          ],
        ),
      ),
    );
  }
}
