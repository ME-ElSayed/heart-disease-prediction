class PredictResponse {
  final bool hasHeartDisease;
  final double probability;

  const PredictResponse({
    required this.hasHeartDisease,
    required this.probability,
  });

  factory PredictResponse.fromJson(Map<String, dynamic> json) {
    return PredictResponse(
      hasHeartDisease: json['has_heart_disease'] as bool,
      probability: (json['probability'] as num).toDouble(),
    );
  }
}
