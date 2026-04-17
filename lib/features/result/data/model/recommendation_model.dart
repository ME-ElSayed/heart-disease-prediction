import 'package:flutter/material.dart';

class RecommendationModel {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const RecommendationModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}