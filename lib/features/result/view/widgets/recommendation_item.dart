import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_styles.dart';
import 'package:heart_disease_prediction/features/result/data/model/recommendation_model.dart';

class RecommendationItem extends StatelessWidget {
  final RecommendationModel rec;
  const RecommendationItem({super.key, required this.rec});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: rec.color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(rec.icon, color: rec.color, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(rec.title, style: TextStyles.font20BlackSemiBold),
                ),
                SizedBox(height: 2.h),
                Text(rec.description, style: TextStyles.font14GreyRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
