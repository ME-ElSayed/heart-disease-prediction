import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_images.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        children: [
          Flexible(child: SizedBox(height: 180)),

          Container(
            height: 320.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: AssetImage(AppImages.heart),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 48.h),

          // ── Headline ──
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Predict Heart\n Disease ',
                  style: TextStyles.font40BlackExtraBold.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                TextSpan(
                  text: 'Early',
                  style: TextStyles.font40BlackExtraBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // ── Subtext ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Text(
              'AI-powered analysis based on your health data',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font18Regular,
            ),
          ),
        ],
      ),
    );
  }
}
