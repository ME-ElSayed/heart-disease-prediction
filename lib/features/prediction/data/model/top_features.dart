import 'package:flutter/material.dart';

class TopFeature {
  final String feature;
  final double impact;

  const TopFeature({
    required this.feature,
    required this.impact,
  });

  factory TopFeature.fromJson(Map<String, dynamic> json) {
    return TopFeature(
      feature: json['feature'] as String,
      impact: (json['impact'] as num).toDouble(),
    );
  }

  /// Strips the sklearn pipeline prefix and returns a human-readable label.
  /// e.g. "skewed_num__oldpeak" → "Oldpeak"
  ///      "one_hot__exang_True"  → "Exang"
  String get label {
    const overrides = {
      'ordinal__cp': 'Chest Pain Type',
      'normal_num__thalch': 'Max Heart Rate',
      'skewed_num__stress_index': 'Stress Index',
      'one_hot__exang_True': 'Exercise Angina',
      'skewed_num__oldpeak': 'ST Depression',
      'normal_num__trestbps': 'Blood Pressure',
      'skewed_num__chol': 'Cholesterol',
    };

    if (overrides.containsKey(feature)) return overrides[feature]!;

    // Fallback: strip prefix (everything up to and including "__")
    final raw = feature.contains('__') ? feature.split('__').last : feature;
    return raw
        .replaceAll('_', ' ')
        .split(' ')
        .map((w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }

  IconData get icon {
    const iconMap = {
      'ordinal__cp': Icons.monitor_heart_outlined,
      'normal_num__thalch': Icons.favorite_rounded,
      'skewed_num__stress_index': Icons.psychology_outlined,
      'one_hot__exang_True': Icons.directions_run_rounded,
      'skewed_num__oldpeak': Icons.show_chart_rounded,
      'normal_num__trestbps': Icons.speed_rounded,
      'skewed_num__chol': Icons.water_drop_rounded,
    };
    return iconMap[feature] ?? Icons.bar_chart_rounded;
  }
}

