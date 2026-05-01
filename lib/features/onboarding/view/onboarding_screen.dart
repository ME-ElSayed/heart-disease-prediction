import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_disease_prediction/core/helper/shared_pref_helper.dart';
import 'package:heart_disease_prediction/features/onboarding/view/widgets/page_indicator.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import 'widgets/how_it_works_page.dart';
import 'widgets/welcome_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      GetIt.instance.get<SharedPrefHelper>().boolSetter(
        key: 'seenOnboarding',
        value: true,
      );
      context.go(Routes.healthInput);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ── Page View ──
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                children: const [WelcomePage(), HowItWorksPage()],
              ),
            ),

            // ── Bottom Section ──
            Padding(
              padding: EdgeInsets.fromLTRB(32.w, 25.5.h, 32.w, 31.8.h),
              child: Column(
                children: [
                  // Page Indicator
                  PageIndicator(pageController: _pageController),
                  SizedBox(height: 31.8.h),

                  // Action Button
                  AppButton(
                    height: 72.h,
                    text: _currentPage == 0 ? 'Next' : 'Get Started',
                    icon: _currentPage == 0
                        ? Icons.arrow_forward_rounded
                        : Icons.rocket_launch_rounded,
                    onPressed: _onNextPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
