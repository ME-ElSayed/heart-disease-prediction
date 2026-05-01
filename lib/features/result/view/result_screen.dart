import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';
import 'package:heart_disease_prediction/core/theme/widgets/theme_toggle_button.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/contributing_factors.dart';
import 'package:heart_disease_prediction/features/result/view/widgets/metric_cards.dart';

import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_button.dart';
import '../../prediction/data/model/predict_response.dart';
import '../../prediction/data/model/prediction_input_data.dart';
import 'widgets/recommendations_section.dart';
import 'widgets/risk_gauge.dart';

class ResultScreen extends StatelessWidget {
  final PredictResponse response;
  final PredictionInputData inputData;

  const ResultScreen({
    super.key,
    required this.response,
    required this.inputData,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: Text(
          'Risk Profile',
          style: TextStyles.font20BlackSemiBold.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: ThemeToggleButton(),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
                child: Column(
                  children: [
                    RiskGauge(
                      probability: response.probability,
                      hasHeartDisease: response.hasHeartDisease,
                    ),
                    SizedBox(height: 16.h),

                    MetricCards(inputData: inputData),

                    SizedBox(height: 16.h),

                    ContributingFactors(topFeatures: response.topFeatures),

                    SizedBox(height: 16.h),

                    RecommendationsSection(
                      isHighRisk: response.hasHeartDisease,
                    ),

                    SizedBox(height: 24.h),

                    AppButton(
                      text: 'Try Again',
                      isOutlined: true,
                      onPressed: () => context.go(Routes.healthInput),
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
