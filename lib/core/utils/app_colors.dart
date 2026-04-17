import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Primary ──
  static const Color primary = Color(0xFF0058BC);
  static const Color primaryContainer = Color(0xFF0070EB);
  static const Color primaryFixed = Color(0xFFD8E2FF);
  static const Color primaryFixedDim = Color(0xFFADC6FF);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFFEFCFF);

  // ── Secondary ──
  static const Color secondary = Color(0xFF4C4ACA);
  static const Color secondaryContainer = Color(0xFF6664E4);
  static const Color secondaryFixed = Color(0xFFE2DFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // ── Tertiary / Error ──
  static const Color tertiary = Color(0xFFBC000A);
  static const Color tertiaryContainer = Color(0xFFE2241F);
  static const Color tertiaryFixed = Color(0xFFFFDAD5);
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);

  // ── Surface System ──
  static const Color surface = Color(0xFFFAF9FE);
  static const Color surfaceBright = Color(0xFFFAF9FE);
  static const Color surfaceContainer = Color(0xFFEEEDF3);
  static const Color surfaceContainerHigh = Color(0xFFE9E7ED);
  static const Color surfaceContainerHighest = Color(0xFFE3E2E7);
  static const Color surfaceContainerLow = Color(0xFFF4F3F8);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceDim = Color(0xFFDAD9DF);
  static const Color surfaceVariant = Color(0xFFE3E2E7);

  // ── On Surface ──
  static const Color onSurface = Color(0xFF1A1B1F);
  static const Color onSurfaceVariant = Color(0xFF414755);
  static const Color inverseSurface = Color(0xFF2F3034);
  static const Color inverseOnSurface = Color(0xFFF1F0F5);
  static const Color inversePrimary = Color(0xFFADC6FF);

  // ── Outline ──
  static const Color outline = Color(0xFF717786);
  static const Color outlineVariant = Color(0xFFC1C6D7);

  // ── Semantic (for result screen) ──
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color successGreenLight = Color(0xFFE8F5E9);
  static const Color warningAmber = Color(0xFFF57F17);
  static const Color warningAmberLight = Color(0xFFFFF8E1);

  // ── Gradient ──
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryContainer],
  );
}
