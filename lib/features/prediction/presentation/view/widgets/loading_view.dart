import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heart_disease_prediction/core/utils/app_images.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  int _messageIndex = 0;
  final List<String> _loadingMessages = [
    'Analyzing your health data...',
    'Running heart disease model...',
    'Calculating risk factors...',
    'Reviewing clinical indicators...',
    'Almost there, hang tight...',
  ];

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
    _startMessageCycle();
  }

  void _startMessageCycle() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      _fadeController.reverse().then((_) {
        if (!mounted) return;
        setState(() {
          _messageIndex = (_messageIndex + 1) % _loadingMessages.length;
        });
        _fadeController.forward();
        _startMessageCycle();
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Lottie animation with subtle pulse
              ScaleTransition(
                scale: _pulseAnimation,
                child: LottieBuilder.asset(
                  AppImages.heartRate,
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: 40.h),

              // App title
              Text(
                'Heart Health AI',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                  letterSpacing: 0.3,
                ),
              ),

              SizedBox(height: 10.h),

              // Animated loading message
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  _loadingMessages[_messageIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Dot loader
              _DotsLoader(),

              const Spacer(flex: 3),

              // Bottom hint
            ],
          ),
        ),
      ),
    );
  }
}

class _DotsLoader extends StatefulWidget {
  @override
  State<_DotsLoader> createState() => _DotsLoaderState();
}

class _DotsLoaderState extends State<_DotsLoader>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  static const int _dotCount = 3;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _dotCount,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _animations = _controllers
        .map(
          (c) => Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(parent: c, curve: Curves.easeInOut)),
        )
        .toList();

    _startSequence();
  }

  void _startSequence() async {
    while (mounted) {
      for (int i = 0; i < _dotCount; i++) {
        if (!mounted) return;
        _controllers[i].forward();
        await Future.delayed(const Duration(milliseconds: 160));
      }
      await Future.delayed(const Duration(milliseconds: 300));
      for (int i = 0; i < _dotCount; i++) {
        if (!mounted) return;
        _controllers[i].reverse();
        await Future.delayed(const Duration(milliseconds: 100));
      }
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_dotCount, (i) {
        return AnimatedBuilder(
          animation: _animations[i],
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.lerp(
                  colorScheme.primary.withValues(alpha: 0.25),
                  colorScheme.primary,
                  _animations[i].value,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
