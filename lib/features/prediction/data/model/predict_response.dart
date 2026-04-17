import 'package:heart_disease_prediction/features/prediction/data/model/top_features.dart';

class PredictResponse {
  final bool hasHeartDisease;
  final double probability;
  final List<TopFeature> topFeatures;

  const PredictResponse({
    required this.hasHeartDisease,
    required this.probability,
    required this.topFeatures,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      hasHeartDisease: (json['prediction'] as int) == 1,
      probability: (json['probability'] as num).toDouble(),
      topFeatures: (json['top_features'] as List<dynamic>)
          .map((e) => TopFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}