import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_prediction/core/theme/cubit/theme_cubit.dart';
import 'package:heart_disease_prediction/core/theme/extension/theme_extension.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final isDarkMode = context.isDarkMode;

        return IconButton(
          tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme(
              Theme.of(context).brightness,
            );
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: Icon(
              isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDarkMode),
            ),
          ),
        );
      },
    );
  }
}
