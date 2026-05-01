import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get font36BlackBold => TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.onSurface,
      );

  static TextStyle get font28BlackBold => TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.onSurface,
      );

  static TextStyle get font24BlackBold => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.onSurface,
      );

  static TextStyle get font22BlackBold => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.onSurface,
      );

  static TextStyle get font40BlackExtraBold => TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeightHelper.extraBold,
        color: AppColors.onSurface,
      );

  static TextStyle get font20BlackSemiBold => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.onSurface,
      );

  static TextStyle get font18BlackSemiBold => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.onSurface,
      );

  static TextStyle get font18Regular => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get font16BlackMedium => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.onSurface,
      );

  static TextStyle get font16BlackSemiBold => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: AppColors.onSurface,
      );

  static TextStyle get font14BlackRegular => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.onSurface,
      );

  static TextStyle get font14BlackMedium => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.onSurface,
      );

  static TextStyle get font14GreyRegular => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get font13GreyRegular => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get font12BlackMedium => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.onSurface,
      );

  static TextStyle get font12GreyRegular => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: AppColors.onSurfaceVariant,
      );

  static TextStyle get font12WhiteMedium => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: Colors.white,
      );

  static TextStyle get font16WhiteSemiBold => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: Colors.white,
      );

  static TextStyle get font14PrimaryMedium => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
        color: AppColors.primary,
      );
}
