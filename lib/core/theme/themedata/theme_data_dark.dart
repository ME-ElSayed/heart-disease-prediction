import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/theme/app_colors.dart';
import 'package:heart_disease_prediction/core/theme/app_styles.dart';

ThemeData getDarkTheme() {
  final colorScheme =
      ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: _DarkThemeColors.primaryContainer,
        onPrimaryContainer: _DarkThemeColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: _DarkThemeColors.secondaryContainer,
        tertiary: AppColors.tertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: _DarkThemeColors.errorContainer,
        onErrorContainer: _DarkThemeColors.onErrorContainer,
        surface: _DarkThemeColors.surface,
        onSurface: _DarkThemeColors.onSurface,
        onSurfaceVariant: _DarkThemeColors.onSurfaceVariant,
        outline: _DarkThemeColors.outline,
        outlineVariant: _DarkThemeColors.outlineVariant,
        inverseSurface: _DarkThemeColors.inverseSurface,
        onInverseSurface: _DarkThemeColors.inverseOnSurface,
        inversePrimary: AppColors.primaryFixedDim,
        surfaceContainerLowest: _DarkThemeColors.surfaceContainerLowest,
        surfaceContainerLow: _DarkThemeColors.surfaceContainerLow,
        surfaceContainer: _DarkThemeColors.surfaceContainer,
        surfaceContainerHigh: _DarkThemeColors.surfaceContainerHigh,
        surfaceContainerHighest: _DarkThemeColors.surfaceContainerHighest,
      );

  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: _DarkThemeColors.background,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    splashFactory: InkSparkle.splashFactory,
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: _DarkThemeColors.onSurface,
      displayColor: _DarkThemeColors.onSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _DarkThemeColors.surface,
      foregroundColor: _DarkThemeColors.onSurface,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.font20BlackSemiBold.copyWith(
        color: _DarkThemeColors.onSurface,
      ),
      iconTheme: const IconThemeData(color: _DarkThemeColors.onSurfaceVariant),
    ),
    iconTheme: const IconThemeData(color: _DarkThemeColors.onSurfaceVariant),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: _DarkThemeColors.onSurfaceVariant,
        backgroundColor: _DarkThemeColors.surfaceContainerLow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: _DarkThemeColors.outlineVariant,
        disabledForegroundColor: _DarkThemeColors.onSurfaceVariant,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyles.font16WhiteSemiBold,
      ),
    ),

    // Input field
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _DarkThemeColors.surfaceContainerHigh,
      errorMaxLines: 2,
      hintStyle: TextStyles.font14GreyRegular.copyWith(
        color: _DarkThemeColors.onSurfaceVariant,
      ),
      errorStyle: TextStyles.font12GreyRegular.copyWith(
        color: _DarkThemeColors.onErrorContainer,
      ),
      suffixStyle: TextStyles.font12GreyRegular.copyWith(
        color: _DarkThemeColors.onSurfaceVariant,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.error.withValues(alpha: 0.55),
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: _DarkThemeColors.onErrorContainer,
          width: 1,
        ),
      ),
    ),

    // Outlined button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: TextStyles.font16BlackSemiBold.copyWith(
          color: AppColors.primary,
        ),
      ),
    ),

    // Dropdown
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyles.font14BlackRegular.copyWith(
        color: _DarkThemeColors.onSurface,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          _DarkThemeColors.surfaceContainerLow,
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return _DarkThemeColors.onSurfaceVariant;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return _DarkThemeColors.primaryContainer;
        }
        return _DarkThemeColors.surfaceContainerHighest;
      }),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    ),

    // Slider
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: _DarkThemeColors.surfaceContainerHighest,
      thumbColor: AppColors.primary,
      overlayColor: AppColors.primary.withValues(alpha: 0.16),
      trackHeight: 4,
      valueIndicatorColor: AppColors.primary,
      valueIndicatorTextStyle: TextStyles.font12WhiteMedium,
    ),

    // Progress / loading
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
      circularTrackColor: _DarkThemeColors.surfaceContainerHighest,
    ),

    // Snackbar
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _DarkThemeColors.inverseSurface,
      contentTextStyle: TextStyles.font14BlackRegular.copyWith(
        color: _DarkThemeColors.inverseOnSurface,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),

    // Text selection
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withValues(alpha: 0.22),
      selectionHandleColor: AppColors.primary,
    ),

    // General surface helpers
    dividerColor: _DarkThemeColors.outlineVariant,
    cardColor: _DarkThemeColors.surfaceContainerLow,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: _DarkThemeColors.surfaceContainerLow,
      surfaceTintColor: Colors.transparent,
    ),
  );
}

class _DarkThemeColors {
  const _DarkThemeColors._();

  static const Color background = Color(0xFF0B1017);
  static const Color surface = Color(0xFF111722);
  static const Color surfaceContainerLowest = Color(0xFF161D28);
  static const Color surfaceContainerLow = Color(0xFF1A2230);
  static const Color surfaceContainer = Color(0xFF202938);
  static const Color surfaceContainerHigh = Color(0xFF263040);
  static const Color surfaceContainerHighest = Color(0xFF2E394A);

  static const Color onSurface = Color(0xFFEAF1FF);
  static const Color onSurfaceVariant = Color(0xFFB4C0D3);
  static const Color outline = Color(0xFF7E8BA1);
  static const Color outlineVariant = Color(0xFF394557);

  static const Color primaryContainer = Color(0xFF123A68);
  static const Color onPrimaryContainer = Color(0xFFD8E6FF);
  static const Color secondaryContainer = Color(0xFF2E2F78);

  static const Color errorContainer = Color(0xFF7D1D1D);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  static const Color inverseSurface = Color(0xFFEAF1FF);
  static const Color inverseOnSurface = Color(0xFF121924);
}
